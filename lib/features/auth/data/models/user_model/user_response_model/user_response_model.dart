import 'package:expense_tracker/features/auth/data/models/user_model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@freezed
@immutable
class UserResponseModel with _$UserResponseModel {
  const factory UserResponseModel({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "message") String? msg,
    @JsonKey(name: "data") UserModel? data,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);
}
