import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static const _baseUrl = 'https://api.ourtownevent.com/api';
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  ApiClient._internal(this.dio, this.secureStorage) {
    dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
    );

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          // Endpoints that should NOT include an Authorization header
          const publicPaths = [
            '/users/token/', // sign in
            '/users/register/', // sign up
            '/users/verify_otp/', // email / OTP verification
            '/users/forgot_password_request/', // forgot password
          ];

          // If this is a public auth endpoint, don't attach a token
          if (publicPaths.any((p) => options.path.startsWith(p))) {
            return handler.next(options);
          }

          // For all other endpoints, attach token if available
          final token = await secureStorage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (err, handler) async {
          // basic 401 -> try refresh token flow
          if (err.response?.statusCode == 401) {
            final refresh = await secureStorage.read(key: 'refresh_token');
            if (refresh != null) {
              try {
                final r = await Dio().post(
                  '$_baseUrl/users/token/refresh/',
                  data: {'refresh': refresh},
                );
                final newAccess = r.data['access'];
                final newRefresh = r.data['refresh'] ?? refresh;
                await secureStorage.write(
                  key: 'access_token',
                  value: newAccess,
                );
                await secureStorage.write(
                  key: 'refresh_token',
                  value: newRefresh,
                );
                // retry original request with new token
                final opts = err.requestOptions;
                opts.headers['Authorization'] = 'Bearer $newAccess';
                final cloneReq = await dio.fetch(opts);
                return handler.resolve(cloneReq);
              } catch (e) {
                // refresh failed — fall through and let error propagate
              }
            }
          }
          return handler.next(err);
        },
      ),
    );
  }

  static ApiClient create() {
    final dio = Dio();
    final storage = const FlutterSecureStorage();
    return ApiClient._internal(dio, storage);
  }
}
