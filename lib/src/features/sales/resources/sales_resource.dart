import 'dart:async';
import 'dart:convert';
import 'package:backend/src/features/sales/errors/errors.dart';
import 'package:backend/src/features/sales/repositories/sales_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../../auth/guard/auth_guard.dart';

class SalesResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/sales', _getAllSales, middlewares: [AuthGuard()]),
        Route.get('/sales/:customer_id', _getSalesById,
            middlewares: [AuthGuard()]),
        Route.get('/sales/products/:sales_id', _getProductsSalesBySalesId,
            middlewares: [AuthGuard()]),
        Route.post('/sales', _createSales),
        Route.put('/sales', _updateSales, middlewares: [AuthGuard()]),
        Route.delete('/sales/:id', _deleteSalesByid,
            middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _getAllSales(Injector injector) async {
    final salesRepository = injector.get<SalesRepository>();
    try {
      final result = await salesRepository.getAllSales();
      return Response.ok(jsonEncode(result));
    } on SalesException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getSalesById(
      ModularArguments arguments, Injector injector) async {
    final customerId = arguments.params['customer_id'];
    final salesRepository = injector.get<SalesRepository>();
    try {
      final result = await salesRepository.getSalesById(customerId);
      return Response.ok(jsonEncode(result));
    } on SalesException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getProductsSalesBySalesId(
      ModularArguments arguments, Injector injector) async {
    final salesRepository = injector.get<SalesRepository>();
    final salesId = arguments.params['sales_id'];

    try {
      final result = await salesRepository.getProductsSalesBySalesId(salesId);
      return Response.ok(jsonEncode(result));
    } on SalesException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _createSales(
      ModularArguments arguments, Injector injector) async {
    final salesRepository = injector.get<SalesRepository>();
    final data = arguments.data as Map;
    try {
      final result = await salesRepository.createSales(
        data['customer_id'],
        data['total'],
      );
      return Response.ok(result.toJson());
    } on SalesException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateSales(
      ModularArguments arguments, Injector injector) async {
    final salesParams = (arguments.data as Map).cast<String, dynamic>();
    final salesRepository = injector.get<SalesRepository>();
    try {
      await salesRepository.updateSales(salesParams);
      return Response.ok(jsonEncode({'message': 'ok'}));
    } on SalesException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _deleteSalesByid(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final salesRepository = injector.get<SalesRepository>();
    try {
      final result = await salesRepository.deleteSales(id);
      return Response.ok(jsonEncode(result));
    } on SalesException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
