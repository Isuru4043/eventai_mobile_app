import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_client.dart';

class AuthService {
  final ApiClient _apiClient;
  final FlutterSecureStorage _storage;

  AuthService(this._apiClient) : _storage = _apiClient.secureStorage;

  /// Sign in using credentials. Matches Postman: POST /users/token/
  Future<void> signIn({required String email, required String password}) async {
    try {
      print("AUTH → Sending login request...");

      final resp = await _apiClient.dio.post(
        '/users/token/',
        data: {'email': email, 'password': password},
        options: Options(contentType: Headers.jsonContentType),
      );

      print("AUTH → Login success. Raw response: ${resp.data}");

      final data = resp.data;

      // Extract tokens (adjust if backend uses other names)
      final access = data['access'] ?? data['access_token'] ?? data['token'];
      final refresh = data['refresh'] ?? data['refresh_token'];

      if (access == null) {
        throw Exception("Auth error: server did not return an access token.");
      }

      print("AUTH → Saving tokens to secure storage...");
      await _storage.write(key: 'access_token', value: access);
      if (refresh != null) {
        await _storage.write(key: 'refresh_token', value: refresh);
      }

      print("AUTH → Tokens saved. Login complete.");
    } on DioError catch (e) {
      print("AUTH → Dio error occurred: ${e.type}");

      // If backend returned a response (400, 401, 500, etc.)
      if (e.response != null) {
        print("AUTH → STATUS: ${e.response!.statusCode}");
        print("AUTH → RESPONSE DATA: ${e.response!.data}");

        final status = e.response!.statusCode!;
        final body = e.response!.data;

        // Extract server error message if exists
        String serverMsg = "Login failed";
        if (body is Map && body['detail'] != null) {
          serverMsg = body['detail'];
        } else if (body.toString().isNotEmpty) {
          serverMsg = body.toString();
        }

        // Common login errors
        if (status == 400 || status == 401) {
          throw Exception(serverMsg);
        }

        throw Exception("Server error ($status): $serverMsg");
      }

      // No response at all → network issue
      throw Exception(
        "Network error: Could not reach server. (${e.type}) ${e.message}",
      );
    } catch (e) {
      // Any other unexpected error
      print("AUTH → Unexpected error: $e");
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
