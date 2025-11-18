// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataModelImpl _$$UserDataModelImplFromJson(Map<String, dynamic> json) =>
    _$UserDataModelImpl(
      id: json['id'] as num?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      lang: json['lang'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birth_date'] as String?,
      avatar: json['avatar'] as String?,
      cityName: json['city_name'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      completeRegistration: json['complete_registration'] as String?,
      promoCode: json['promo_code'] as String?,
      vip: json['vip'] as bool?,
      vipDaysRemaining: json['vip_days_remaining'] as num?,
      vipDaysTotal: json['vip_days_total'] as num?,
      availableBalance: json['available_balance'] as num?,
    );

Map<String, dynamic> _$$UserDataModelImplToJson(_$UserDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'lang': instance.lang,
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'avatar': instance.avatar,
      'city_name': instance.cityName,
      'city_id': instance.cityId,
      'status': instance.status,
      'complete_registration': instance.completeRegistration,
      'promo_code': instance.promoCode,
      'vip': instance.vip,
      'vip_days_remaining': instance.vipDaysRemaining,
      'vip_days_total': instance.vipDaysTotal,
      'available_balance': instance.availableBalance,
    };
