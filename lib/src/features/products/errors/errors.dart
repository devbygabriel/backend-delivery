import 'dart:convert';

class ProductsException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final int statusCode;

  ProductsException(this.statusCode, this.message, [this.stackTrace]);

  String toJson() {
    return jsonEncode({'error': message});
  }

  @override
  String toString() =>
      'ProductsException(message: $message, stackTrace: $stackTrace, statusCode: $statusCode)';
}
