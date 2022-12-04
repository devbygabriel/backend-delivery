import 'dart:async';
import 'package:backend/src/features/erp_users/errors/errors.dart';
import 'package:backend/src/features/erp_users/models/ErpUsersModel.dart';
import '../../../core/services/bcrypt/bcrypt_service.dart';

abstract class ErpUsersDataSource {
  Future<dynamic> getAllErpUsersDataSource();
  Future<Map> getErpUsersByIdDataSource(id);
  Future<Map> createErpUsersDataSource(params);
  Future<Map> updateErpUsersDataSource(params);
  Future<dynamic> deleteErpUsersDataSource(id);
  Future<String> getPasswordById(id);
  Future<String> getPasswordByEmail(email);
  Future<void> updatePasswordById(id, String password);
  Future<dynamic> getAllErpUsersByNameOrEmailDataSource(String filter);
}

class ErpUsersRepository {
  final BCryptService bcrypt;
  final ErpUsersDataSource datasource;

  ErpUsersRepository(this.datasource, this.bcrypt);

  FutureOr<dynamic> getAllErpUsers() async {
    final erpUsersMap = await datasource.getAllErpUsersDataSource();
    return erpUsersMap;
  }

  Future<ErpUsersModel> getErpUsersById(id) async {
    final erpUsersMap = await datasource.getErpUsersByIdDataSource(id);
    return _getErpUsers(erpUsersMap);
  }

  Future<ErpUsersModel> createErpUsers(params) async {
    params['password'] = bcrypt.generateHash(params['password']);
    final erpUsersMap = await datasource.createErpUsersDataSource(params);
    return _getErpUsers(erpUsersMap);
  }

  Future<ErpUsersModel> updateErpUsers(params) async {
    final erpUsersMap = await datasource.updateErpUsersDataSource(params);
    return _getErpUsers(erpUsersMap);
  }

  FutureOr<dynamic> getAllErpUsersByNameOrEmail(String filter) async {
    final erpUsersMap =
        await datasource.getAllErpUsersByNameOrEmailDataSource(filter);
    return erpUsersMap;
  }

  Future<void> updateErpUsersPassword(
    id,
    String password,
    String newPassword,
  ) async {
    final hash = await datasource.getPasswordById(id);

    if (!bcrypt.checkHash(password, hash)) {
      throw ErpUsersException(403, 'Senha inválida');
    }

    if (newPassword == '') {
      throw ErpUsersException(403, 'A nova senha não pode ser em branco');
    }

    newPassword = bcrypt.generateHash(newPassword);

    await datasource.updatePasswordById(
      id,
      newPassword,
    );
  }

  Future<void> erpUsersLogin(
    String email,
    String password,
  ) async {
    final hash = await datasource.getPasswordByEmail(email);

    if (!bcrypt.checkHash(password, hash)) {
      throw ErpUsersException(403, 'Senha inválida');
    }

    if (password == '') {
      throw ErpUsersException(403, 'A senha não pode ser em branco');
    }
  }

  FutureOr<dynamic> deleteErpUsers(id) async {
    final result = await datasource.deleteErpUsersDataSource(id);
    return result;
  }

  ErpUsersModel _getErpUsers(Map erpUsersMap) {
    return ErpUsersModel(
      id: erpUsersMap[0]['id'],
      name: erpUsersMap[0]['name'],
      email: erpUsersMap[0]['email'],
      telephone: erpUsersMap[0]['telephone'],
      createdAt: (erpUsersMap[0]['created_at'] as DateTime).toUtc().toString(),
      updatedAt: (erpUsersMap[0]['updated_at'] as DateTime).toUtc().toString(),
    );
  }
}
