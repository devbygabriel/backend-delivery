import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

FutureOr<Response> swaggerHandler(Request resquest) {
  final path = 'specs/swagger.yaml';
  final handler = SwaggerUI(
    path,
    title: 'Cup Delivery',
    deepLink: true,
  );
  return handler(resquest);
}
