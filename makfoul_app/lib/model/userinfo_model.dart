class UserModel {
  String uid;
  String username;
  String email;
  String role;
  String phone;
  String? url;
  String createdAt;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.role,
    required this.phone,
    this.url,
    required this.createdAt,
  });
}
