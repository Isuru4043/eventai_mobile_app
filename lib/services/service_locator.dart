import 'api_client.dart';
import 'auth_service.dart';

final apiClient = ApiClient.create();
final authService = AuthService(apiClient);
