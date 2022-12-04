import 'dart:async';
import 'dart:convert';
import 'package:backend/src/features/customers/errors/errors.dart';
import 'package:backend/src/features/customers/repositories/customers_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import '../../auth/guard/auth_guard.dart';

class CustomersResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/customer', _getAllCustomer, middlewares: [AuthGuard()]),
        Route.get('/customer/:id', _getCustomerById,
            middlewares: [AuthGuard()]),
        Route.post('/customer', _createCustomer),
        Route.put('/customer', _updateCustomer, middlewares: [AuthGuard()]),
        Route.delete('/customer/:id', _deleteCustomerByid,
            middlewares: [AuthGuard()]),
        Route.put('/customer/password', _updateCustomerPassword,
            middlewares: [AuthGuard()]),
        Route.post('/customer/login', _customerLogin,
            middlewares: [AuthGuard()]),
        Route.get('/customer/:filter', _getAllCustomerByNameOrEmail,
            middlewares: [AuthGuard()]),
      ];

  FutureOr<Response> _getAllCustomer(Injector injector) async {
    final customerRepository = injector.get<CustomerRepository>();
    try {
      final result = await customerRepository.getAllCustomers();
      return Response.ok(jsonEncode(result));
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getCustomerById(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final customerRepository = injector.get<CustomerRepository>();
    try {
      final result = await customerRepository.getCustomerById(id);
      return Response.ok(result.toJson());
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _createCustomer(
      ModularArguments arguments, Injector injector) async {
    final customerParams = (arguments.data as Map).cast<String, dynamic>();
    final customerRepository = injector.get<CustomerRepository>();
    try {
      final result = await customerRepository.createCustomer(customerParams);
      return Response.ok(result.toJson());
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateCustomer(
      ModularArguments arguments, Injector injector) async {
    final customerParams = (arguments.data as Map).cast<String, dynamic>();
    final customerRepository = injector.get<CustomerRepository>();
    try {
      final result = await customerRepository.updateCustomer(customerParams);
      return Response.ok(result.toJson());
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _getAllCustomerByNameOrEmail(
      ModularArguments arguments, Injector injector) async {
    final customerRepository = injector.get<CustomerRepository>();
    final filter = arguments.params['filter'];
    try {
      final result =
          await customerRepository.getAllCustomerByNameOrEmail(filter);
      return Response.ok(jsonEncode(result));
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _updateCustomerPassword(
      ModularArguments arguments, Injector injector) async {
    final customerRepository = injector.get<CustomerRepository>();
    final data = arguments.data as Map;

    try {
      await customerRepository.updateCustomerPassword(
        data['id'],
        data['password'],
        data['newPassword'],
      );
      return Response.ok(jsonEncode({'message': 'ok'}));
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _customerLogin(
      ModularArguments arguments, Injector injector) async {
    final customerRepository = injector.get<CustomerRepository>();
    final data = arguments.data as Map;

    try {
      final result = await customerRepository.customerLogin(
        data['email'],
        data['password'],
      );
      return Response.ok(result.toJson());
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }

  FutureOr<Response> _deleteCustomerByid(
      ModularArguments arguments, Injector injector) async {
    final id = arguments.params['id'];
    final customerRepository = injector.get<CustomerRepository>();
    try {
      final result = await customerRepository.deleteCustomer(id);
      return Response.ok(jsonEncode(result));
    } on CustomersException catch (e) {
      return Response(e.statusCode,
          body: e.toJson(), headers: {'content-type': 'application/json'});
    }
  }
}
