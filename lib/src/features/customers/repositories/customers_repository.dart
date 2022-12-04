import 'dart:async';
import 'package:backend/src/features/customers/errors/errors.dart';
import 'package:backend/src/features/customers/models/CustomersModel.dart';
import '../../../core/services/bcrypt/bcrypt_service.dart';

abstract class CustomersDataSource {
  Future<dynamic> getAllCustomersDataSource();
  Future<Map> getCustomerByIdDataSource(id);
  Future<Map> getCustomerByEmailDataSource(email);
  Future<Map> createCustomerDataSource(params);
  Future<Map> updateCustomerDataSource(params);
  Future<dynamic> deleteCustomerDataSource(id);
  Future<String> getPasswordByIdDataSource(id);
  Future<String> getPasswordByEmailDataSource(email);
  Future<String> getIdByCpfDataSource(cpf);
  Future<String> getIdByEmailDataSource(email);
  Future<void> updatePasswordByIdDataSource(id, String password);
  Future<dynamic> getAllCustomerByNameOrEmailDataSource(filter);
}

class CustomerRepository {
  final BCryptService bcrypt;
  final CustomersDataSource datasource;

  CustomerRepository(this.datasource, this.bcrypt);

  FutureOr<dynamic> getAllCustomers() async {
    final customerMap = await datasource.getAllCustomersDataSource();
    return customerMap;
  }

  Future<CustomersModel> getCustomerById(id) async {
    final customerMap = await datasource.getCustomerByIdDataSource(id);
    return _getCustomers(customerMap);
  }

  Future<CustomersModel> createCustomer(params) async {
    final resultEmail =
        await datasource.getIdByEmailDataSource(params['email']);

    if (resultEmail != '') {
      throw CustomersException(403, 'Este e-mail já está em uso');
    }

    final resultCpf = await datasource.getIdByEmailDataSource(params['cpf']);

    if (resultCpf != '') {
      throw CustomersException(403, 'Este CPF já está em uso');
    }

    params['password'] = bcrypt.generateHash(params['password']);
    final customerMap = await datasource.createCustomerDataSource(params);
    return _getCustomers(customerMap);
  }

  Future<CustomersModel> updateCustomer(params) async {
    final customerMap = await datasource.updateCustomerDataSource(params);
    return _getCustomers(customerMap);
  }

  FutureOr<dynamic> getAllCustomerByNameOrEmail(filter) async {
    final customerMap =
        await datasource.getAllCustomerByNameOrEmailDataSource(filter);
    return customerMap;
  }

  Future<void> updateCustomerPassword(
    id,
    String password,
    String newPassword,
  ) async {
    final hash = await datasource.getPasswordByIdDataSource(id);

    if (!bcrypt.checkHash(password, hash)) {
      throw CustomersException(403, 'Senha inválida');
    }

    if (newPassword == '') {
      throw CustomersException(403, 'A nova senha não pode ser em branco');
    }

    newPassword = bcrypt.generateHash(newPassword);

    await datasource.updatePasswordByIdDataSource(
      id,
      newPassword,
    );
  }

  Future<CustomersModel> customerLogin(
    String email,
    String password,
  ) async {
    final hash = await datasource.getPasswordByEmailDataSource(email);

    if (hash == '') {
      throw CustomersException(403, 'E-mail inválido');
    }

    if (!bcrypt.checkHash(password, hash)) {
      throw CustomersException(403, 'Senha inválida');
    }

    if (password == '') {
      throw CustomersException(403, 'A senha não pode ser em branco');
    }

    final customerMap = await datasource.getCustomerByEmailDataSource(email);
    return _getCustomers(customerMap);
  }

  FutureOr<dynamic> deleteCustomer(id) async {
    final result = await datasource.deleteCustomerDataSource(id);
    return result;
  }

  CustomersModel _getCustomers(Map customerMap) {
    return CustomersModel(
      id: customerMap[0]['id'],
      name: customerMap[0]['name'],
      email: customerMap[0]['email'],
      telephone: customerMap[0]['telephone'],
      cpf: customerMap[0]['cpf'],
      zipCode: customerMap[0]['zip_code'],
      publicPlace: customerMap[0]['public_place'],
      number: customerMap[0]['number'],
      complement: customerMap[0]['complement'],
      city: customerMap[0]['city'],
      district: customerMap[0]['district'],
    );
  }
}
