import '../../../core/services/database/remote_database.dart';
import '../repositories/api_users_repository.dart';

class ApiUserDataSourceImpl implements ApiUserDataSource {
  final RemoteDatabase database;

  ApiUserDataSourceImpl(this.database);

  @override
  Future<Map> createApiUserDataSource(params) async {
    final result = await database.query(
      'INSERT INTO api_users (username, password, role) VALUES (@username, @password, @role) RETURNING id, username, role, created_at, updated_at',
      variables: params,
    );

    final listUser = result.map((e) => e['api_users']).toList();
    return listUser.asMap();
  }

  @override
  Future<dynamic> deleteApiUserDataSource(id) async {
    await database
        .query('DELETE FROM api_users WHERE id = @id', variables: {'id': id});

    Map<String, dynamic> result = {'message': 'deleted user $id'};

    return result;
  }

  @override
  Future<dynamic> getAllApiUserDataSource() async {
    final result = await database.query(
      "SELECT id, username, role, created_at::TIMESTAMP::DATE, updated_at::TIMESTAMP::DATE FROM api_users",
    );

    final listUser = result.map((e) => e['api_users']).toList();

    Map<String, dynamic> users = {'result': listUser};

    return users;
  }

  @override
  Future<Map> getApiUserByIdDataSource(id) async {
    final result = await database.query(
        "SELECT id, username, role, created_at, updated_at FROM api_users WHERE id=@id",
        variables: {'id': id});
    final listUser = result.map((e) => e['api_users']).toList();
    return listUser.asMap();
  }

  @override
  Future<Map> updateApiUserDataSource(params) async {
    final columns = params.keys
        .where((key) => key != 'id')
        .where((key) => key != 'password')
        .map((key) => '$key=@$key')
        .toList();

    final result = await database.query(
      'UPDATE api_users SET ${columns.join(',')} WHERE id = @id RETURNING id, username, role, created_at, updated_at',
      variables: params,
    );
    final listUser = result.map((e) => e['api_users']).toList();
    return listUser.asMap();
  }
}
