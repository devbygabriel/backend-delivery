import 'package:backend/src/features/auth/repositories/auth_repository.dart';
import '../../../core/services/database/remote_database.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final RemoteDatabase database;

  AuthDataSourceImpl(this.database);

  @override
  Future<Map> getIdAndRoleByUsername(String username) async {
    final result = await database.query(
      'SELECT id, role, password FROM api_users WHERE username = @username',
      variables: {'username': username},
    );

    if (result.isEmpty) {
      return {};
    }

    return result.map((element) => element['api_users']).first!;
  }

  @override
  Future<String> getIdAndRoleById(id) async {
    final result = await database.query(
      'SELECT role FROM api_users WHERE id = @id',
      variables: {'id': id},
    );

    return result.map((element) => element['api_users']).first!['role'];
  }

  @override
  Future<String> getPasswordById(id) async {
    final result = await database.query(
        'SELECT password FROM api_users WHERE id = @id',
        variables: {'id': id});

    return result.map((element) => element['api_users']).first!['password'];
  }

  @override
  Future<void> updatePasswordById(id, String password) async {
    await database.query(
        'UPDATE api_users SET password = @password WHERE id = @id',
        variables: {
          'password': password,
          'id': id,
        });
  }
}
