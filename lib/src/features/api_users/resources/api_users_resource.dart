import 'dart:async';
import 'dart:convert';
import 'package:backend/src/features/api_users/errors/errors.dart';
import 'package:backend/src/features/api_users/repositories/api_users_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../../auth/guard/auth_guard.dart';

class ApiUserResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/user', _getAllUser, middlewares: [AuthGuard()]),
        Route.get('/user/:id', _getUserById, middlewares: [AuthGuard()]),
        Route.post('/user', _createUser),
        Route.put('/user', _updateUser, middlewares: [AuthGuard()]),
        Route.delete('/user/:id', _deleteUserByid, middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _getAllUser(Injector injector) async {
    final apiUserRepository = injector.get<ApiUserRepository>();
    try {
      final result = await apiUserRepository.getAllApiUser();
      return Response.ok(jsonEncode(result));
    } on ApiUserException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getUserById(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final apiUserRepository = injector.get<ApiUserRepository>();
    try {
      final result = await apiUserRepository.getApiUserById(id);
      return Response.ok(result.toJson());
    } on ApiUserException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _createUser(
      ModularArguments arguments, Injector injector) async {
    final userParams = (arguments.data as Map).cast<String, dynamic>();
    final apiUserRepository = injector.get<ApiUserRepository>();
    try {
      final result = await apiUserRepository.createUser(userParams);
      return Response.ok(result.toJson());
    } on ApiUserException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateUser(
      ModularArguments arguments, Injector injector) async {
    final userParams = (arguments.data as Map).cast<String, dynamic>();
    final apiUserRepository = injector.get<ApiUserRepository>();
    try {
      final result = await apiUserRepository.updateUser(userParams);
      return Response.ok(result.toJson());
    } on ApiUserException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _deleteUserByid(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final apiUserRepository = injector.get<ApiUserRepository>();
    try {
      final result = await apiUserRepository.deleteUser(id);
      return Response.ok(jsonEncode(result));
    } on ApiUserException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
