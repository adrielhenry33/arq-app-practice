// app/repositories/auth_repository.dart
import 'package:arq_app/app/interfaces/local_storage_interface.dart';

class AuthRepository {
  final LocalStorageInterface _localStorage;

  // O construtor é a única parte que lida com a injeção.
  // Ele recebe a interface que foi fornecida pelo Modular.
  AuthRepository({required LocalStorageInterface localStorage})
      : _localStorage = localStorage;

  final String _authKey = 'user_auth_token';

  Future<void> saveAuthToken(String token) async {
    await _localStorage.put(_authKey, token);
  }

  Future<String?> getAuthToken() async {
    final token = await _localStorage.get(_authKey);
    if (token is String) {
      return token;
    }
    return null;
  }
  
  Future<void> logout() async {
    await _localStorage.delete(_authKey);
  }
}