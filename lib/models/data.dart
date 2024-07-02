import 'dart:io';

class userModel {
  final String username;
  final String? password;
  final String email;
  final File image;

  userModel(
      {required this.username,
      this.password,
      required this.email,
      required this.image});
}
