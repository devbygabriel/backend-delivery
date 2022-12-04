import 'dart:convert';

class ApiUserException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final int statusCode;

  ApiUserException(this.statusCode, this.message, [this.stackTrace]);

  String toJson() {
    return jsonEncode({'error': message});
  }

  @override
  String toString() =>
      'ApiUserException(message: $message, stackTrace: $stackTrace, statusCode: $statusCode)';
}
