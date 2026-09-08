class UserModel {
  final String name;
  final String email;
  final String userType;
  final String uid;
  UserModel({
    required this.uid,
    required this.userType,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userType: json['userType'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uid': uid, 'userType': userType};
  }
}
