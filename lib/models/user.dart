class UserModel {
  final String id;
  final String name;
  final String email;
  final String? studentId;
  final String? department;
  final double rating;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.studentId,
    this.department,
    this.rating = 5.0,
    required this.avatarUrl,
  });
}
