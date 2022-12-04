import 'dart:async';
import 'dart:convert';
import 'package:backend/src/features/products/errors/errors.dart';
import 'package:backend/src/features/products/repositories/products_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../../auth/guard/auth_guard.dart';

class ProductsResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/products', _getAllProducts, middlewares: [AuthGuard()]),
        Route.get('/products/:id', _getProductsById,
            middlewares: [AuthGuard()]),
        Route.post('/products', _createProducts),
        Route.put('/products', _updateProducts, middlewares: [AuthGuard()]),
        Route.delete('/products/:id', _deleteProductsByid,
            middlewares: [AuthGuard()]),
        Route.get('/products/:filter', _getAllProductsByDescription,
            middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _getAllProducts(Injector injector) async {
    final productsRepository = injector.get<ProductsRepository>();
    try {
      final result = await productsRepository.getAllProducts();
      return Response.ok(jsonEncode(result));
    } on ProductsException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getProductsById(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final productsRepository = injector.get<ProductsRepository>();
    try {
      final result = await productsRepository.getProductsById(id);
      return Response.ok(result.toJson());
    } on ProductsException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _createProducts(
      ModularArguments arguments, Injector injector) async {
    final productsParams = (arguments.data as Map).cast<String, dynamic>();
    final productsRepository = injector.get<ProductsRepository>();
    try {
      final result = await productsRepository.createProducts(productsParams);
      return Response.ok(result.toJson());
    } on ProductsException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateProducts(
      ModularArguments arguments, Injector injector) async {
    final productsParams = (arguments.data as Map).cast<String, dynamic>();
    final productsRepository = injector.get<ProductsRepository>();
    try {
      final result = await productsRepository.updateProducts(productsParams);
      return Response.ok(result.toJson());
    } on ProductsException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getAllProductsByDescription(
      ModularArguments arguments, Injector injector) async {
    final productsRepository = injector.get<ProductsRepository>();
    final filter = arguments.params['filter'];
    try {
      final result =
          await productsRepository.getAllProductsByDescription(filter);
      return Response.ok(jsonEncode(result));
    } on ProductsException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _deleteProductsByid(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final productsRepository = injector.get<ProductsRepository>();
    try {
      final result = await productsRepository.deleteProducts(id);
      return Response.ok(jsonEncode(result));
    } on ProductsException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
