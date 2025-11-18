import 'package:expense_tracker/core/models/domain_model/base_domain_model.dart';

class UserDomainModel extends BaseDomainModel {
  num? id;
  String? promoCode;
  String? name;
  String? phone;
  String? email;
  String? lang;
  String? gender;
  String? birthDate;
  String? avatar;
  String? cityName;
  num? cityId;
  String? status;
  String? token;
  int? vip;
  String? completeRegistration;
  String? inviteFriendBonusMessage;
  String? inviteFriendBonusAmount;
  UserDomainModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.lang,
    required this.gender,
    required this.promoCode,
    required this.birthDate,
    required this.avatar,
    required this.cityName,
    required this.cityId,
    required this.status,
    required this.token,
    required this.vip,
    required this.completeRegistration,
    required this.inviteFriendBonusMessage,
    required this.inviteFriendBonusAmount,
  });

// String get getFullName => firstName + lastName;
}
