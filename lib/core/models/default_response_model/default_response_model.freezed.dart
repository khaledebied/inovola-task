// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DefaultResponseModel _$DefaultResponseModelFromJson(Map<String, dynamic> json) {
  return _DefaultResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DefaultResponseModel {
  @JsonKey(name: 'key')
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DefaultResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultResponseModelCopyWith<DefaultResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultResponseModelCopyWith<$Res> {
  factory $DefaultResponseModelCopyWith(DefaultResponseModel value,
          $Res Function(DefaultResponseModel) then) =
      _$DefaultResponseModelCopyWithImpl<$Res, DefaultResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'key') String? key,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$DefaultResponseModelCopyWithImpl<$Res,
        $Val extends DefaultResponseModel>
    implements $DefaultResponseModelCopyWith<$Res> {
  _$DefaultResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultResponseModelImplCopyWith<$Res>
    implements $DefaultResponseModelCopyWith<$Res> {
  factory _$$DefaultResponseModelImplCopyWith(_$DefaultResponseModelImpl value,
          $Res Function(_$DefaultResponseModelImpl) then) =
      __$$DefaultResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'key') String? key,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$$DefaultResponseModelImplCopyWithImpl<$Res>
    extends _$DefaultResponseModelCopyWithImpl<$Res, _$DefaultResponseModelImpl>
    implements _$$DefaultResponseModelImplCopyWith<$Res> {
  __$$DefaultResponseModelImplCopyWithImpl(_$DefaultResponseModelImpl _value,
      $Res Function(_$DefaultResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DefaultResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? message = freezed,
  }) {
    return _then(_$DefaultResponseModelImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultResponseModelImpl implements _DefaultResponseModel {
  _$DefaultResponseModelImpl(
      {@JsonKey(name: 'key') this.key, @JsonKey(name: 'message') this.message});

  factory _$DefaultResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'key')
  final String? key;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'DefaultResponseModel(key: $key, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultResponseModelImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, message);

  /// Create a copy of DefaultResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultResponseModelImplCopyWith<_$DefaultResponseModelImpl>
      get copyWith =>
          __$$DefaultResponseModelImplCopyWithImpl<_$DefaultResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultResponseModelImplToJson(
      this,
    );
  }
}

abstract class _DefaultResponseModel implements DefaultResponseModel {
  factory _DefaultResponseModel(
          {@JsonKey(name: 'key') final String? key,
          @JsonKey(name: 'message') final String? message}) =
      _$DefaultResponseModelImpl;

  factory _DefaultResponseModel.fromJson(Map<String, dynamic> json) =
      _$DefaultResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'key')
  String? get key;
  @override
  @JsonKey(name: 'message')
  String? get message;

  /// Create a copy of DefaultResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultResponseModelImplCopyWith<_$DefaultResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
