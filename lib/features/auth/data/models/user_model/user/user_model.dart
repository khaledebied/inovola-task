import 'package:expense_tracker/core/models/api_model/base_api_model.dart';
import 'package:expense_tracker/features/auth/data/models/user_model/user_data_model/user_data_model.dart';
import 'package:expense_tracker/features/auth/domain/entity/user_domain_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
@immutable
class UserModel extends BaseApiModel<UserDomainModel> with _$UserModel {
  const UserModel._();

  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "uuid") String? uuid,
    @JsonKey(name: "user_data") UserDataModel? user,
    @JsonKey(name: "enable_notifications") bool? enableNotifications,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  UserDomainModel toDomainModel() {
    // TODO: implement toDomainModel
    throw UnimplementedError();
  }
}
