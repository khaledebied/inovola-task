// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      token: json['token'] as String?,
      uuid: json['uuid'] as String?,
      user: json['user_data'] == null
          ? null
          : UserDataModel.fromJson(json['user_data'] as Map<String, dynamic>),
      enableNotifications: json['enable_notifications'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'uuid': instance.uuid,
      'user_data': instance.user?.toJson(),
      'enable_notifications': instance.enableNotifications,
    };
