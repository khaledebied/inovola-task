// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_rate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyRateEntity _$CurrencyRateEntityFromJson(Map<String, dynamic> json) {
  return _CurrencyRateEntity.fromJson(json);
}

/// @nodoc
mixin _$CurrencyRateEntity {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this CurrencyRateEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyRateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyRateEntityCopyWith<CurrencyRateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateEntityCopyWith<$Res> {
  factory $CurrencyRateEntityCopyWith(
          CurrencyRateEntity value, $Res Function(CurrencyRateEntity) then) =
      _$CurrencyRateEntityCopyWithImpl<$Res, CurrencyRateEntity>;
  @useResult
  $Res call({String from, String to, double rate, DateTime lastUpdated});
}

/// @nodoc
class _$CurrencyRateEntityCopyWithImpl<$Res, $Val extends CurrencyRateEntity>
    implements $CurrencyRateEntityCopyWith<$Res> {
  _$CurrencyRateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyRateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyRateEntityImplCopyWith<$Res>
    implements $CurrencyRateEntityCopyWith<$Res> {
  factory _$$CurrencyRateEntityImplCopyWith(_$CurrencyRateEntityImpl value,
          $Res Function(_$CurrencyRateEntityImpl) then) =
      __$$CurrencyRateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, double rate, DateTime lastUpdated});
}

/// @nodoc
class __$$CurrencyRateEntityImplCopyWithImpl<$Res>
    extends _$CurrencyRateEntityCopyWithImpl<$Res, _$CurrencyRateEntityImpl>
    implements _$$CurrencyRateEntityImplCopyWith<$Res> {
  __$$CurrencyRateEntityImplCopyWithImpl(_$CurrencyRateEntityImpl _value,
      $Res Function(_$CurrencyRateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$CurrencyRateEntityImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyRateEntityImpl implements _CurrencyRateEntity {
  const _$CurrencyRateEntityImpl(
      {required this.from,
      required this.to,
      required this.rate,
      required this.lastUpdated});

  factory _$CurrencyRateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyRateEntityImplFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final double rate;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'CurrencyRateEntity(from: $from, to: $to, rate: $rate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyRateEntityImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, rate, lastUpdated);

  /// Create a copy of CurrencyRateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyRateEntityImplCopyWith<_$CurrencyRateEntityImpl> get copyWith =>
      __$$CurrencyRateEntityImplCopyWithImpl<_$CurrencyRateEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyRateEntityImplToJson(
      this,
    );
  }
}

abstract class _CurrencyRateEntity implements CurrencyRateEntity {
  const factory _CurrencyRateEntity(
      {required final String from,
      required final String to,
      required final double rate,
      required final DateTime lastUpdated}) = _$CurrencyRateEntityImpl;

  factory _CurrencyRateEntity.fromJson(Map<String, dynamic> json) =
      _$CurrencyRateEntityImpl.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  double get rate;
  @override
  DateTime get lastUpdated;

  /// Create a copy of CurrencyRateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyRateEntityImplCopyWith<_$CurrencyRateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
