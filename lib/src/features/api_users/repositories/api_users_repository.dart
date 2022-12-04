import 'dart:async';
import 'package:backend/src/features/api_users/models/ApiUserModel.dart';
import '../../../core/services/bcrypt/bcrypt_service.dart';

abstract class ApiUserDataSource {
  Future<dynamic> getAllApiUserDataSource();
  Future<Map> getApiUserByIdDataSource(id);
  Future<Map> createApiUserDataSource(params);
  Future<Map> updateApiUserDataSource(params);
  Future<dynamic> deleteApiUserDataSource(id);
}

class ApiUserRepository {
  final BCryptService bcrypt;
  final ApiUserDataSource datasource;

  ApiUserRepository(this.datasource, this.bcrypt);

  FutureOr<dynamic> getAllApiUser() async {
    final userMap = await datasource.getAllApiUserDataSource();
    return userMap;
  }

  Future<ApiUserModel> getApiUserById(id) async {
    final userMap = await datasource.getApiUserByIdDataSource(id);
    return _getApiUsers(userMap);
  }

  Future<ApiUserModel> createUser(params) async {
    params['password'] = bcrypt.generateHash(params['password']);
    final userMap = await datasource.createApiUserDataSource(params);
    return _getApiUsers(userMap);
  }

  Future<ApiUserModel> updateUser(params) async {
    final userMap = await datasource.updateApiUserDataSource(params);
    return _getApiUsers(userMap);
  }

  FutureOr<dynamic> deleteUser(id) async {
    final result = await datasource.deleteApiUserDataSource(id);
    return result;
  }

  ApiUserModel _getApiUsers(Map userMap) {
    return ApiUserModel(
      id: userMap[0]['id'],
      username: userMap[0]['username'],
      role: userMap[0]['role'],
      createdAt: (userMap[0]['created_at'] as DateTime).toUtc().toString(),
      updatedAt: (userMap[0]['updated_at'] as DateTime).toUtc().toString(),
    );
  }
}
