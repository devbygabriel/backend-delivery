import 'package:backend/src/core/services/dot_env/dot_env_service.dart';
import 'package:backend/src/core/services/jwt/dart_jsonwebtoken/jwt_service_impl.dart';
import 'package:test/test.dart';

void main() {
  final dotEnvService = DotEnvService(mocks: {
    'JWT_KEY': 'dihfiUHFoiudhfosfF1e5sf1s1f5f1EF15',
  });

  final jwt = JwtServiceImpl(dotEnvService);
  final expiresDate = DateTime.now().add(Duration(seconds: 30));
  final expiresIn =
      Duration(milliseconds: expiresDate.millisecondsSinceEpoch).inSeconds;

  final token = jwt.generateToken(
      {'id': 1, 'role': 'Tecno X Sistemas', 'exp': expiresIn}, 'accessToken');

  test('jwt create ...', () async {
    print(token);
  });

  test('jwt verify', () async {
    jwt.verifyToken(
      token,
      'accessToken',
    );
  });

  test('jwt payload', () async {
    final payload = jwt.getPayload(token);
    print(payload);
  });
}
