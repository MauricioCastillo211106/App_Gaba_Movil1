class AuthManager {
  // Instancia privada del Singleton
  static final AuthManager _instance = AuthManager._internal();

  // Constructor privado
  AuthManager._internal();

  // Obtener la instancia única del Singleton
  static AuthManager get instance => _instance;

  // Variable para almacenar el token
  String? _token;

  // Método para establecer el token
  void setToken(String token) {
    _token = token;
  }

  // Método para obtener el token
  String? getToken() {
    return _token;
  }
}