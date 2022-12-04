import 'dart:async';
import 'dart:convert';
import 'package:backend/src/features/erp_users/errors/errors.dart';
import 'package:backend/src/features/erp_users/repositories/erp_users_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../../auth/guard/auth_guard.dart';

class ErpUsersResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/erpuser', _getAllErpUsers, middlewares: [AuthGuard()]),
        Route.get('/erpuser/:id', _getErpUsersById, middlewares: [AuthGuard()]),
        Route.post('/erpuser', _createErpUsers),
        Route.put('/erpuser', _updateErpUsers, middlewares: [AuthGuard()]),
        Route.delete('/erpuser/:id', _deleteErpUsersByid,
            middlewares: [AuthGuard()]),
        Route.put('/erpuser/password', _updateErpUsersPassword,
            middlewares: [AuthGuard()]),
        Route.post('/erpuser/login', _erpUsersLogin,
            middlewares: [AuthGuard()]),
        Route.get('/erpuser/:filter', _getAllErpUsersByNameOrEmail,
            middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _getAllErpUsers(Injector injector) async {
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    try {
      final result = await erpUsersRepository.getAllErpUsers();
      return Response.ok(jsonEncode(result));
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getErpUsersById(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    try {
      final result = await erpUsersRepository.getErpUsersById(id);
      return Response.ok(result.toJson());
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _createErpUsers(
      ModularArguments arguments, Injector injector) async {
    final erpUsersParams = (arguments.data as Map).cast<String, dynamic>();
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    try {
      final result = await erpUsersRepository.createErpUsers(erpUsersParams);
      return Response.ok(result.toJson());
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateErpUsers(
      ModularArguments arguments, Injector injector) async {
    final erpUsersParams = (arguments.data as Map).cast<String, dynamic>();
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    try {
      final result = await erpUsersRepository.updateErpUsers(erpUsersParams);
      return Response.ok(result.toJson());
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getAllErpUsersByNameOrEmail(
      ModularArguments arguments, Injector injector) async {
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    final String filter = arguments.params['filter'];
    try {
      final result =
          await erpUsersRepository.getAllErpUsersByNameOrEmail(filter);
      return Response.ok(jsonEncode(result));
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateErpUsersPassword(
      ModularArguments arguments, Injector injector) async {
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    final data = arguments.data as Map;

    try {
      await erpUsersRepository.updateErpUsersPassword(
        data['id'],
        data['password'],
        data['newPassword'],
      );
      return Response.ok(jsonEncode({'message': 'ok'}));
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _erpUsersLogin(
      ModularArguments arguments, Injector injector) async {
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    final data = arguments.data as Map;

    try {
      await erpUsersRepository.erpUsersLogin(
        data['email'],
        data['password'],
      );
      return Response.ok(jsonEncode({'message': 'ok'}));
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _deleteErpUsersByid(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final erpUsersRepository = injector.get<ErpUsersRepository>();
    try {
      final result = await erpUsersRepository.deleteErpUsers(id);
      return Response.ok(jsonEncode(result));
    } on ErpUsersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
