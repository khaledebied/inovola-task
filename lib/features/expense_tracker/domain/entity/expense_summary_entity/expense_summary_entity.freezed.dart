// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseSummaryEntity _$ExpenseSummaryEntityFromJson(Map<String, dynamic> json) {
  return _ExpenseSummaryEntity.fromJson(json);
}

/// @nodoc
mixin _$ExpenseSummaryEntity {
  double get totalExpenses => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  Map<String, double> get categoryBreakdown =>
      throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this ExpenseSummaryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseSummaryEntityCopyWith<ExpenseSummaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseSummaryEntityCopyWith<$Res> {
  factory $ExpenseSummaryEntityCopyWith(ExpenseSummaryEntity value,
          $Res Function(ExpenseSummaryEntity) then) =
      _$ExpenseSummaryEntityCopyWithImpl<$Res, ExpenseSummaryEntity>;
  @useResult
  $Res call(
      {double totalExpenses,
      double totalIncome,
      double balance,
      Map<String, double> categoryBreakdown,
      String currency});
}

/// @nodoc
class _$ExpenseSummaryEntityCopyWithImpl<$Res,
        $Val extends ExpenseSummaryEntity>
    implements $ExpenseSummaryEntityCopyWith<$Res> {
  _$ExpenseSummaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpenses = null,
    Object? totalIncome = null,
    Object? balance = null,
    Object? categoryBreakdown = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      categoryBreakdown: null == categoryBreakdown
          ? _value.categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseSummaryEntityImplCopyWith<$Res>
    implements $ExpenseSummaryEntityCopyWith<$Res> {
  factory _$$ExpenseSummaryEntityImplCopyWith(_$ExpenseSummaryEntityImpl value,
          $Res Function(_$ExpenseSummaryEntityImpl) then) =
      __$$ExpenseSummaryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalExpenses,
      double totalIncome,
      double balance,
      Map<String, double> categoryBreakdown,
      String currency});
}

/// @nodoc
class __$$ExpenseSummaryEntityImplCopyWithImpl<$Res>
    extends _$ExpenseSummaryEntityCopyWithImpl<$Res, _$ExpenseSummaryEntityImpl>
    implements _$$ExpenseSummaryEntityImplCopyWith<$Res> {
  __$$ExpenseSummaryEntityImplCopyWithImpl(_$ExpenseSummaryEntityImpl _value,
      $Res Function(_$ExpenseSummaryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpenses = null,
    Object? totalIncome = null,
    Object? balance = null,
    Object? categoryBreakdown = null,
    Object? currency = null,
  }) {
    return _then(_$ExpenseSummaryEntityImpl(
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      categoryBreakdown: null == categoryBreakdown
          ? _value._categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseSummaryEntityImpl implements _ExpenseSummaryEntity {
  const _$ExpenseSummaryEntityImpl(
      {required this.totalExpenses,
      required this.totalIncome,
      required this.balance,
      required final Map<String, double> categoryBreakdown,
      required this.currency})
      : _categoryBreakdown = categoryBreakdown;

  factory _$ExpenseSummaryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseSummaryEntityImplFromJson(json);

  @override
  final double totalExpenses;
  @override
  final double totalIncome;
  @override
  final double balance;
  final Map<String, double> _categoryBreakdown;
  @override
  Map<String, double> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryBreakdown);
  }

  @override
  final String currency;

  @override
  String toString() {
    return 'ExpenseSummaryEntity(totalExpenses: $totalExpenses, totalIncome: $totalIncome, balance: $balance, categoryBreakdown: $categoryBreakdown, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseSummaryEntityImpl &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality()
                .equals(other._categoryBreakdown, _categoryBreakdown) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalExpenses,
      totalIncome,
      balance,
      const DeepCollectionEquality().hash(_categoryBreakdown),
      currency);

  /// Create a copy of ExpenseSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseSummaryEntityImplCopyWith<_$ExpenseSummaryEntityImpl>
      get copyWith =>
          __$$ExpenseSummaryEntityImplCopyWithImpl<_$ExpenseSummaryEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseSummaryEntityImplToJson(
      this,
    );
  }
}

abstract class _ExpenseSummaryEntity implements ExpenseSummaryEntity {
  const factory _ExpenseSummaryEntity(
      {required final double totalExpenses,
      required final double totalIncome,
      required final double balance,
      required final Map<String, double> categoryBreakdown,
      required final String currency}) = _$ExpenseSummaryEntityImpl;

  factory _ExpenseSummaryEntity.fromJson(Map<String, dynamic> json) =
      _$ExpenseSummaryEntityImpl.fromJson;

  @override
  double get totalExpenses;
  @override
  double get totalIncome;
  @override
  double get balance;
  @override
  Map<String, double> get categoryBreakdown;
  @override
  String get currency;

  /// Create a copy of ExpenseSummaryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseSummaryEntityImplCopyWith<_$ExpenseSummaryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
