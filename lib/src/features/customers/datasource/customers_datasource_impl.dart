import '../../../core/services/database/remote_database.dart';
import '../repositories/customers_repository.dart';

class CustomersDataSourceImpl implements CustomersDataSource {
  final RemoteDatabase database;

  CustomersDataSourceImpl(this.database);

  @override
  Future<Map> createCustomerDataSource(params) async {
    final result = await database.query(
      'INSERT INTO customers (name, email, telephone, password, cpf, zip_code, public_place, number, complement, city, district) VALUES (@name, @email, @telephone, @password, @cpf, @zip_code, @public_place, @number, @complement, @city, @district) RETURNING id, name, email, telephone, cpf, zip_code, public_place, number, complement, city, district',
      variables: params,
    );
    final listCostumer = result.map((e) => e['customers']).toList();
    return listCostumer.asMap();
  }

  @override
  Future<dynamic> deleteCustomerDataSource(id) async {
    await database
        .query('DELETE FROM customers WHERE id = @id', variables: {'id': id});

    Map<String, dynamic> result = {'message': 'deleted customer $id'};

    return result;
  }

  @override
  Future<dynamic> getAllCustomersDataSource() async {
    final result = await database.query(
      "SELECT id, name, email, telephone, password, cpf, zip_code, public_place, number, complement, city, district FROM customers",
    );
    final listCostumers = result.map((e) => e['customers']).toList();

    Map<String, dynamic> customers = {'result': listCostumers};

    return customers;
  }

  @override
  Future<Map> getCustomerByIdDataSource(id) async {
    final result = await database.query(
        "SELECT id, name, email, telephone, password, cpf, zip_code, public_place, number, complement, city, district FROM customers WHERE id=@id",
        variables: {'id': id});
    final listCostumer = result.map((e) => e['customers']).toList();
    return listCostumer.asMap();
  }

  @override
  Future<Map> getCustomerByEmailDataSource(email) async {
    final result = await database.query(
        "SELECT id, name, email, telephone, password, cpf, zip_code, public_place, number, complement, city, district FROM customers WHERE email=@email",
        variables: {'email': email});
    final listCostumer = result.map((e) => e['customers']).toList();
    return listCostumer.asMap();
  }

  @override
  Future<Map> updateCustomerDataSource(params) async {
    final columns = params.keys
        .where((key) => key != 'id')
        .where((key) => key != 'email')
        .where((key) => key != 'password')
        .where((key) => key != 'cpf')
        .map((key) => '$key=@$key')
        .toList();

    final result = await database.query(
      'UPDATE customers SET ${columns.join(',')} WHERE id = @id RETURNING id, name, email, telephone, password, cpf, zip_code, public_place, number, complement, city, district',
      variables: params,
    );
    final listCostumer = result.map((e) => e['customers']).toList();
    return listCostumer.asMap();
  }

  @override
  Future<String> getPasswordByIdDataSource(id) async {
    final result = await database.query(
        'SELECT password FROM customers WHERE id = @id',
        variables: {'id': id});

    return result.map((element) => element['customers']).first!['password'];
  }

  @override
  Future<String> getIdByCpfDataSource(cpf) async {
    final result = await database.query(
        'SELECT id FROM customers WHERE cpf = @cpf',
        variables: {'cpf': cpf});

    if (result.isEmpty) {
      return '';
    } else {
      return result
          .map((element) => element['customers'])
          .first!['id']
          .toString();
    }
  }

  @override
  Future<String> getIdByEmailDataSource(email) async {
    final result = await database.query(
        'SELECT id FROM customers WHERE email = @email',
        variables: {'email': email});

    if (result.isEmpty) {
      return '';
    } else {
      return result
          .map((element) => element['customers'])
          .first!['id']
          .toString();
    }
  }

  @override
  Future<String> getPasswordByEmailDataSource(email) async {
    final result = await database.query(
        'SELECT password FROM customers WHERE email = @email',
        variables: {'email': email});

    if (result.isEmpty) {
      return '';
    } else {
      return result.map((element) => element['customers']).first!['password'];
    }
  }

  @override
  Future<void> updatePasswordByIdDataSource(id, String password) async {
    await database.query(
        'UPDATE customers SET password = @password WHERE id = @id',
        variables: {
          'password': password,
          'id': id,
        });
  }

  @override
  Future<dynamic> getAllCustomerByNameOrEmailDataSource(filter) async {
    final result = await database.query(
      "SELECT id, name, email, telephone, password, cpf, zip_code, public_place, number, complement, city, district  FROM customers WHERE ((email like '%$filter%')) OR ((name like '%$filter%'))",
    );
    final listCostumers = result.map((e) => e['customers']).toList();

    Map<String, dynamic> customers = {'result': listCostumers};

    return customers;
  }
}
