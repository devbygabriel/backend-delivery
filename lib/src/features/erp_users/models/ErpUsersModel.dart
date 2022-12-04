import 'dart:convert';

class ErpUsersModel {
  final int id;
  final String name;
  final String email;
  final String telephone;
  final String createdAt;
  final String updatedAt;

  ErpUsersModel({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'telephone': telephone,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory ErpUsersModel.fromMap(Map<String, dynamic> map) {
    return ErpUsersModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      telephone: map['telephone'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ErpUsersModel.fromJson(String source) =>
      ErpUsersModel.fromMap(json.decode(source));
}
