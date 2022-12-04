import '../../../core/services/database/remote_database.dart';
import '../repositories/erp_users_repository.dart';

class ErpUsersDataSourceImpl implements ErpUsersDataSource {
  final RemoteDatabase database;

  ErpUsersDataSourceImpl(this.database);

  @override
  Future<Map> createErpUsersDataSource(params) async {
    final result = await database.query(
      'INSERT INTO erp_users (name, email, telephone, password) VALUES (@name, @email, @telephone, @password) RETURNING id, name, email, telephone, created_at, updated_at',
      variables: params,
    );

    final listErpUsers = result.map((e) => e['erp_users']).toList();
    return listErpUsers.asMap();
  }

  @override
  Future<dynamic> deleteErpUsersDataSource(id) async {
    await database
        .query('DELETE FROM erp_users WHERE id = @id', variables: {'id': id});

    Map<String, dynamic> result = {'message': 'deleted user $id'};

    return result;
  }

  @override
  Future<dynamic> getAllErpUsersDataSource() async {
    final result = await database.query(
      "SELECT id, name, email, telephone, created_at::TIMESTAMP::DATE, updated_at::TIMESTAMP::DATE FROM erp_users",
    );

    final listErpUsers = result.map((e) => e['erp_users']).toList();

    Map<String, dynamic> users = {'result': listErpUsers};

    return users;
  }

  @override
  Future<Map> getErpUsersByIdDataSource(id) async {
    final result = await database.query(
        "SELECT id, name, email, telephone, created_at, updated_at FROM erp_users WHERE id=@id",
        variables: {'id': id});

    final listErpUsers = result.map((e) => e['erp_users']).toList();
    return listErpUsers.asMap();
  }

  @override
  Future<Map> updateErpUsersDataSource(params) async {
    final columns = params.keys
        .where((key) => key != 'id')
        .where((key) => key != 'password')
        .map((key) => '$key=@$key')
        .toList();

    final result = await database.query(
      'UPDATE erp_users SET ${columns.join(',')} WHERE id = @id RETURNING id, name, email, telephone, created_at, updated_at',
      variables: params,
    );

    final listErpUsers = result.map((e) => e['erp_users']).toList();
    return listErpUsers.asMap();
  }

  @override
  Future<String> getPasswordById(id) async {
    final result = await database.query(
        'SELECT password FROM erp_users WHERE id = @id',
        variables: {'id': id});

    return result.map((element) => element['erp_users']).first!['password'];
  }

  @override
  Future<String> getPasswordByEmail(email) async {
    final result = await database.query(
        'SELECT password FROM erp_users WHERE email = @email',
        variables: {'email': email});

    return result.map((element) => element['erp_users']).first!['password'];
  }

  @override
  Future<dynamic> getAllErpUsersByNameOrEmailDataSource(String filter) async {
    final result = await database.query(
      "SELECT id, name, email, telephone FROM erp_users WHERE ((name like '%$filter%')) OR ((email like '%$filter%'))",
    );

    final listErpUsers = result.map((e) => e['erp_users']).toList();

    Map<String, dynamic> users = {'result': listErpUsers};

    return users;
  }

  @override
  Future<void> updatePasswordById(id, String password) async {
    await database.query(
        'UPDATE erp_users SET password = @password WHERE id = @id',
        variables: {
          'password': password,
          'id': id,
        });
  }
}
