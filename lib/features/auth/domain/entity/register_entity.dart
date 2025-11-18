class RegisterEntity {
  final String name;
  final String phone;
  final String? gender;
  final String? birthDate;
  final int cityId;
  final String deviceType;
  final String deviceId;
  final String? promoCode;

  RegisterEntity({required this.name, required this.deviceId, required this.phone, required this.deviceType, this.birthDate, required this.cityId, this.promoCode, this.gender});

  Map<String, dynamic> toJson() {
    var json = {
      "name": name,
      "phone": phone,
      "birth_date": birthDate,
      "city_id": cityId,
      "promo_code": promoCode,
      "gender": gender,
      "device_id": deviceId,
      "device_type": deviceType
    };
    json.removeWhere((k, value) => (value == '') || value == null);
    return json;
  }
}
