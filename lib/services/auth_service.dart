import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_client.dart';

class AuthService {
  final ApiClient _apiClient;
  final FlutterSecureStorage _storage;

  AuthService(this._apiClient) : _storage = _apiClient.secureStorage;

  /// Sign in using credentials. Matches Postman: POST /users/token/
  Future<void> signIn({required String email, required String password}) async {
    print("=========== SIGN IN REQUEST ===========");
    print("Email: $email");
    print("Endpoint: /users/token/");
    print("=======================================");

    try {
      final resp = await _apiClient.dio.post(
        '/users/token/',
        data: {'email': email, 'password': password},
        options: Options(contentType: Headers.jsonContentType),
      );

      print("=========== SIGN IN SUCCESS ===========");
      print("Raw response: ${resp.data}");
      print("=======================================");

      final data = resp.data;
      final access = data['access'] ?? data['access_token'] ?? data['token'];
      final refresh = data['refresh'] ?? data['refresh_token'];

      if (access == null) {
        print("ERROR: Access token missing in server response.");
        throw Exception("Auth error: access token missing");
      }

      await _storage.write(key: 'access_token', value: access);
      if (refresh != null) {
        await _storage.write(key: 'refresh_token', value: refresh);
      }
    } on DioError catch (e) {
      print("=========== DIO ERROR ===========");
      print("Type: ${e.type}");

      if (e.response != null) {
        print("STATUS CODE: ${e.response!.statusCode}");
        print("RESPONSE DATA: ${e.response!.data}");
        print("FULL RESPONSE: ${e.response}");

        final status = e.response!.statusCode!;
        final body = e.response!.data;

        String serverMsg = "Unknown server error";
        if (body is Map && body['detail'] != null) {
          serverMsg = body['detail'];
        } else if (body is String) {
          serverMsg = body;
        }

        print("SERVER MESSAGE: $serverMsg");
        print("=================================");

        throw Exception("Server error ($status): $serverMsg");
      }

      print("NO RESPONSE FROM SERVER");
      print("Message: ${e.message}");
      print("=================================");

      throw Exception("Network error: ${e.message}");
    } catch (e) {
      print("=========== UNKNOWN ERROR ===========");
      print(e.toString());
      print("======================================");

      throw Exception("Unexpected error: $e");
    }
  }

  /// Remove tokens + notify backend (optional)
  Future<void> signOut() async {
    print("AUTH → Signing out...");

    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');

    try {
      await _apiClient.dio.post('/users/logout/');
    } catch (_) {
      // logout endpoint failing is not critical
    }

    print("AUTH → Signed out successfully.");
  }
}
