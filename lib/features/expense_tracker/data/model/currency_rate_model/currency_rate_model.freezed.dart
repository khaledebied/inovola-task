// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyRateModel _$CurrencyRateModelFromJson(Map<String, dynamic> json) {
  return _CurrencyRateModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyRateModel {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this CurrencyRateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyRateModelCopyWith<CurrencyRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateModelCopyWith<$Res> {
  factory $CurrencyRateModelCopyWith(
          CurrencyRateModel value, $Res Function(CurrencyRateModel) then) =
      _$CurrencyRateModelCopyWithImpl<$Res, CurrencyRateModel>;
  @useResult
  $Res call({String from, String to, double rate, DateTime lastUpdated});
}

/// @nodoc
class _$CurrencyRateModelCopyWithImpl<$Res, $Val extends CurrencyRateModel>
    implements $CurrencyRateModelCopyWith<$Res> {
  _$CurrencyRateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyRateModel
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
abstract class _$$CurrencyRateModelImplCopyWith<$Res>
    implements $CurrencyRateModelCopyWith<$Res> {
  factory _$$CurrencyRateModelImplCopyWith(_$CurrencyRateModelImpl value,
          $Res Function(_$CurrencyRateModelImpl) then) =
      __$$CurrencyRateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, double rate, DateTime lastUpdated});
}

/// @nodoc
class __$$CurrencyRateModelImplCopyWithImpl<$Res>
    extends _$CurrencyRateModelCopyWithImpl<$Res, _$CurrencyRateModelImpl>
    implements _$$CurrencyRateModelImplCopyWith<$Res> {
  __$$CurrencyRateModelImplCopyWithImpl(_$CurrencyRateModelImpl _value,
      $Res Function(_$CurrencyRateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$CurrencyRateModelImpl(
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
class _$CurrencyRateModelImpl implements _CurrencyRateModel {
  const _$CurrencyRateModelImpl(
      {required this.from,
      required this.to,
      required this.rate,
      required this.lastUpdated});

  factory _$CurrencyRateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyRateModelImplFromJson(json);

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
    return 'CurrencyRateModel(from: $from, to: $to, rate: $rate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyRateModelImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, rate, lastUpdated);

  /// Create a copy of CurrencyRateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyRateModelImplCopyWith<_$CurrencyRateModelImpl> get copyWith =>
      __$$CurrencyRateModelImplCopyWithImpl<_$CurrencyRateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyRateModelImplToJson(
      this,
    );
  }
}

abstract class _CurrencyRateModel implements CurrencyRateModel {
  const factory _CurrencyRateModel(
      {required final String from,
      required final String to,
      required final double rate,
      required final DateTime lastUpdated}) = _$CurrencyRateModelImpl;

  factory _CurrencyRateModel.fromJson(Map<String, dynamic> json) =
      _$CurrencyRateModelImpl.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  double get rate;
  @override
  DateTime get lastUpdated;

  /// Create a copy of CurrencyRateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyRateModelImplCopyWith<_$CurrencyRateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
