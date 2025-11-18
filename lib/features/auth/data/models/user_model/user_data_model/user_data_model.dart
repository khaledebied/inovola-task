import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';
part 'user_data_model.g.dart';

@unfreezed
@immutable
class UserDataModel with _$UserDataModel {
  factory UserDataModel({
    @JsonKey(name: "id") num? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "lang") String? lang,
    @JsonKey(name: "gender") String? gender,
    @JsonKey(name: "birth_date") String? birthDate,
    @JsonKey(name: "avatar") String? avatar,
    @JsonKey(name: "city_name") String? cityName,
    @JsonKey(name: "city_id") int? cityId,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "complete_registration") String? completeRegistration,
    @JsonKey(name: "promo_code") String? promoCode,
    @JsonKey(name: "vip") bool? vip,
    @JsonKey(name: "vip_days_remaining") num? vipDaysRemaining,
    @JsonKey(name: "vip_days_total") num? vipDaysTotal,
    @JsonKey(name: "available_balance") num? availableBalance,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);
}
