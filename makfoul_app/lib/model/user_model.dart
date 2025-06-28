class UserModel {
  String uid;
  String username;
  String email;
  String role;
  String phone;

  String createdAt;

  UserModel({
    required this.uid,
    required this.username,

    required this.email,
    required this.role,
    required this.phone,

    required this.createdAt,
  });
}
