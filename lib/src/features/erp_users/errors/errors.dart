import 'dart:convert';

class ErpUsersException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final int statusCode;

  ErpUsersException(this.statusCode, this.message, [this.stackTrace]);

  String toJson() {
    return jsonEncode({'error': message});
  }

  @override
  String toString() =>
      'ErpUsersException(message: $message, stackTrace: $stackTrace, statusCode: $statusCode)';
}
