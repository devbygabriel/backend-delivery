import 'package:bcrypt/bcrypt.dart';
import 'bcrypt_service.dart';

class BCryptServiceImpl implements BCryptService {
  BCryptServiceImpl(Object object);

  @override
  bool checkHash(String text, String hash) {
    return BCrypt.checkpw(text, hash);
    // true
  }

  @override
  String generateHash(String text) {
    final String hashed = BCrypt.hashpw(text, BCrypt.gensalt());
    return hashed;
    // $2a$10$r6huirn1laq6UXBVu6ga9.sHca6sr6tQl3Tiq9LB6/6LMpR37XEGu
  }
}
