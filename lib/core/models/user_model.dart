import 'package:doctor_hunt/core/models/user_type_enum.dart';

class UserModel {
  final String name;
  final String email;
  final UserType userType;
  final String uid;
  UserModel({
    required this.uid,
    required this.userType,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userType: UserType.fromString(json['userType'] ?? ''),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'userType': userType.nameValue,
    };
  }
}
