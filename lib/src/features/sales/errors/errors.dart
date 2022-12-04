import 'dart:convert';

class SalesException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final int statusCode;

  SalesException(this.statusCode, this.message, [this.stackTrace]);

  String toJson() {
    return jsonEncode({'error': message});
  }

  @override
  String toString() =>
      'SalesException(message: $message, stackTrace: $stackTrace, statusCode: $statusCode)';
}
