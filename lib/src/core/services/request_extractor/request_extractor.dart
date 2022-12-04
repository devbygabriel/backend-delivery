import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class RequestExtractor {
  String getAuthorizationBearer(Request request) {
    var authorization = request.headers['authorization'] ?? '';
    authorization = authorization.split(' ').last;
    return authorization;
  }

  LoginCredential getAuthorizationBasic(Request request) {
    // username:password dados de forma básica em base64
    var authorization = request.headers['authorization'] ?? '';
    authorization = authorization.split(' ').last;
    authorization = String.fromCharCodes(base64Decode(authorization));
    final credential = authorization.split(':');
    return LoginCredential(
      username: credential.first,
      password: credential.last,
    );
  }
}

class LoginCredential {
  final String username;
  final String password;
  LoginCredential({
    required this.username,
    required this.password,
  });
}
