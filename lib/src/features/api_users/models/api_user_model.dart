class ApiUser {
  final int id;
  final String username;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  ApiUser({
    required this.id,
    required this.username,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });
}
