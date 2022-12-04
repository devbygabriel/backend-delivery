import 'dart:async';
import 'dart:convert';
import 'package:backend/src/core/services/request_extractor/request_extractor.dart';
import 'package:backend/src/features/auth/errors/errors.dart';
import 'package:backend/src/features/auth/repositories/auth_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../guard/auth_guard.dart';

class AuthResource extends Resource {
  @override
  List<Route> get routes => [
        // login - faz o login e devolve o token para o usuário
        Route.get('/login', _login),
        // refresh_token - renova o token do usuário
        Route.get('/refresh_token', _refreshToken,
            middlewares: [AuthGuard(isRefreshToken: true)]),
        // check_token - verifica se o token do usuário tem validade
        Route.get('/check_token', _checkToken, middlewares: [AuthGuard()]),
        // update_password - atualiza a senha do usuário
        Route.put('/update_password', _updatePassword,
            middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _login(Request request, Injector injector) async {
    final authRepository = injector.get<AuthRepository>();
    final extractor = injector.get<RequestExtractor>();
    final credential = extractor.getAuthorizationBasic(request);

    try {
      final tokenization = await authRepository.login(credential);
      return Response.ok(tokenization.toJson());
    } on AuthException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _refreshToken(Injector injector, Request request) async {
    final authRepository = injector.get<AuthRepository>();
    final extractor = injector.get<RequestExtractor>();
    final token = extractor.getAuthorizationBearer(request);

    try {
      final tokenization = await authRepository.refreshToken(token);
      return Response.ok(tokenization.toJson());
    } on AuthException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _checkToken() {
    return Response.ok(jsonEncode({'message': 'ok'}));
  }

  FutureOr<Response> _updatePassword(
    Injector injector,
    Request request,
    ModularArguments arguments,
  ) async {
    final authRepository = injector.get<AuthRepository>();
    final extractor = injector.get<RequestExtractor>();
    final token = extractor.getAuthorizationBearer(request);
    final data = arguments.data as Map;

    try {
      await authRepository.updatePassword(
        token,
        data['password'],
        data['newPassword'],
      );
      return Response.ok(jsonEncode({'message': 'ok'}));
    } on AuthException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
