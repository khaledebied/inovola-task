import 'package:dio/dio.dart';

class EditProfileEntity {
  EditProfileEntity({
    required this.name,
    required this.refresh,
    required this.cityId,
    this.gender,
    this.birthDate,
    this.avatar,
  });

  String name;
  bool refresh;
  int cityId;
  String? gender;
  String? birthDate;
  MultipartFile? avatar;

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "birth_date": birthDate,
        "city_id": cityId,
        "avatar": avatar,
      };
}
