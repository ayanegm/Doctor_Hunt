enum UserType {
  admin('Admin'),
  patient('Patient');

  final String nameValue;
  const UserType(this.nameValue);
  static UserType fromString(String value) {
    return UserType.values.firstWhere(
      (role) => role.nameValue.toLowerCase() == value.toLowerCase(),
    );
  }
}
