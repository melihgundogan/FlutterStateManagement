import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserModel {
  final int id;
  final String firstName;
  final String email;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.email,
  });

  UserModel.fromJson(UserMap jsonData)
      : id = jsonData['id'],
        firstName = jsonData['first_name'],
        email = jsonData['email'];

  @override
  String toString() => 'User  FirstName: $firstName, Email: $email';
}

typedef UserMap = Map<String, dynamic>;