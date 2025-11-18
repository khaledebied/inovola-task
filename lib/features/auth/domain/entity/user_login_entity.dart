class UserLoginEntity {
  final String phone;
  UserLoginEntity({
    required this.phone,
  });

  //toJson
  Map<String, dynamic> toJson() => {"phone": phone};
}
