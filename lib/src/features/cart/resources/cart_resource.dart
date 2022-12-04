import 'dart:async';
import 'dart:convert';
import 'package:backend/src/features/cart/errors/errors.dart';
import 'package:backend/src/features/cart/repositories/cart_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../../auth/guard/auth_guard.dart';

class CartResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/cart/:id', _getAllCart, middlewares: [AuthGuard()]),
        Route.post('/cart', _createCart),
        Route.put('/cart', _updateCart, middlewares: [AuthGuard()]),
        Route.delete('/cart/:id', _deleteCartByid, middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _getAllCart(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final cartRepository = injector.get<CartRepository>();

    try {
      final result = await cartRepository.getAllCart(id);
      return Response.ok(jsonEncode(result));
    } on CartException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _createCart(
      ModularArguments arguments, Injector injector) async {
    final cartRepository = injector.get<CartRepository>();
    final data = arguments.data as Map;

    try {
      final result = await cartRepository.createCart(
        data['quantity'],
        data['item'],
        data['customer_id'],
      );
      return Response.ok(result.toJson());
    } on CartException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateCart(
      ModularArguments arguments, Injector injector) async {
    final cartRepository = injector.get<CartRepository>();
    final data = arguments.data as Map;

    try {
      final result = await cartRepository.updateCart(
        data['id'],
        data['quantity'],
      );
      return Response.ok(jsonEncode(result));
    } on CartException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _deleteCartByid(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final cartRepository = injector.get<CartRepository>();
    try {
      final result = await cartRepository.deleteCart(id);
      return Response.ok(jsonEncode(result));
    } on CartException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
