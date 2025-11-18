class EnableNotificationEntity {
  final String deviceId;
  final String deviceType;

  EnableNotificationEntity({required this.deviceId, required this.deviceType});

  //toJson
  Map<String, dynamic> toJson() => {
        'device_id': deviceId,
        'device_type': deviceType,
      };
}
