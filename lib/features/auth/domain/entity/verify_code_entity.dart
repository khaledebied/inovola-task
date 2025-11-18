class VerifyCodeEntity {
  final String phone;
  final String otp;
  final bool refresh;
  final String deviceId;
  final String deviceType;

  VerifyCodeEntity({required this.phone, required this.otp, required this.refresh, required this.deviceId, required this.deviceType});

  //toJson
  Map<String, dynamic> toJson() => {'phone': phone, 'otp': otp, 'device_id': deviceId, 'device_type': deviceType};
}
