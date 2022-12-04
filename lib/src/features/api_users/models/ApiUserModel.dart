import 'dart:convert';

class ApiUserModel {
  final int id;
  final String username;
  final String role;
  final String createdAt;
  final String updatedAt;

  ApiUserModel({
    required this.id,
    required this.username,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'role': role,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory ApiUserModel.fromMap(Map<String, dynamic> map) {
    return ApiUserModel(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      role: map['role'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiUserModel.fromJson(String source) =>
      ApiUserModel.fromMap(json.decode(source));
}
