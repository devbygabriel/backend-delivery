import 'dart:convert';

class CartException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final int statusCode;

  CartException(this.statusCode, this.message, [this.stackTrace]);

  String toJson() {
    return jsonEncode({'error': message});
  }

  @override
  String toString() =>
      'CartException(message: $message, stackTrace: $stackTrace, statusCode: $statusCode)';
}
