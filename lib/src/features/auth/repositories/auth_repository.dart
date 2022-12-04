import 'package:backend/src/features/auth/errors/errors.dart';
import '../../../core/services/bcrypt/bcrypt_service.dart';
import '../../../core/services/jwt/jwt_service.dart';
import '../../../core/services/request_extractor/request_extractor.dart';
import '../models/tokenization.dart';

abstract class AuthDataSource {
  Future<Map> getIdAndRoleByUsername(String username);
  Future<String> getIdAndRoleById(id);
  Future<String> getPasswordById(id);
  Future<void> updatePasswordById(id, String password);
}

class AuthRepository {
  final BCryptService bcrypt;
  final JwtService jwt;
  final AuthDataSource datasource;

  AuthRepository(this.datasource, this.bcrypt, this.jwt);

  Future<Tokenization> login(LoginCredential credential) async {
    final userMap =
        await datasource.getIdAndRoleByUsername(credential.username);

    if (userMap.isEmpty) {
      throw AuthException(403, 'Usuário ou senha invalida');
    }

    if (!bcrypt.checkHash(credential.password, userMap['password'])) {
      throw AuthException(403, 'Usuário ou senha invalida');
    }

    final payload = userMap..remove('password');
    return _generateToken(payload);
  }

  Future<Tokenization> refreshToken(String token) async {
    final payload = jwt.getPayload(token);
    final role = await datasource.getIdAndRoleById(payload['id']);
    return _generateToken({
      'id': payload['id'],
      'role': role,
    });
  }

  Future<void> updatePassword(
    String token,
    String password,
    String newPassword,
  ) async {
    var payload = jwt.getPayload(token);
    final id = payload['id'];
    final hash = await datasource.getPasswordById(id);

    if (!bcrypt.checkHash(password, hash)) {
      throw AuthException(403, 'Senha inválida');
    }

    if (newPassword == '') {
      throw AuthException(403, 'A nova senha não pode ser em branco');
    }

    newPassword = bcrypt.generateHash(newPassword);

    await datasource.updatePasswordById(
      id,
      newPassword,
    );
  }

  Tokenization _generateToken(Map payload) {
    payload['exp'] = _determineExpiration(Duration(hours: 24));

    final accessToken = jwt.generateToken(payload, 'accessToken');

    payload['exp'] = _determineExpiration(Duration(days: 3));
    final refreshToken = jwt.generateToken(payload, 'refreshToken');
    return Tokenization(accessToken: accessToken, refreshToken: refreshToken);
  }

  int _determineExpiration(Duration duration) {
    final expiresDate = DateTime.now().add(duration);
    final expiresIn =
        Duration(milliseconds: expiresDate.millisecondsSinceEpoch);
    return expiresIn.inSeconds;
  }
}
