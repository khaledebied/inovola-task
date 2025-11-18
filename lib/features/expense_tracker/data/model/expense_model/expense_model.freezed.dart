// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) {
  return _ExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get category => throw _privateConstructorUsedError;
  @HiveField(2)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(3)
  String get currency => throw _privateConstructorUsedError;
  @HiveField(4)
  double get convertedAmount => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get receiptPath => throw _privateConstructorUsedError;
  @HiveField(8)
  String get categoryIcon => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ExpenseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) then) =
      _$ExpenseModelCopyWithImpl<$Res, ExpenseModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String category,
      @HiveField(2) double amount,
      @HiveField(3) String currency,
      @HiveField(4) double convertedAmount,
      @HiveField(5) DateTime date,
      @HiveField(6) String? description,
      @HiveField(7) String? receiptPath,
      @HiveField(8) String categoryIcon,
      @HiveField(9) DateTime? createdAt,
      @HiveField(10) DateTime? updatedAt});
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res, $Val extends ExpenseModel>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? amount = null,
    Object? currency = null,
    Object? convertedAmount = null,
    Object? date = null,
    Object? description = freezed,
    Object? receiptPath = freezed,
    Object? categoryIcon = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      convertedAmount: null == convertedAmount
          ? _value.convertedAmount
          : convertedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptPath: freezed == receiptPath
          ? _value.receiptPath
          : receiptPath // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseModelImplCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$$ExpenseModelImplCopyWith(
          _$ExpenseModelImpl value, $Res Function(_$ExpenseModelImpl) then) =
      __$$ExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String category,
      @HiveField(2) double amount,
      @HiveField(3) String currency,
      @HiveField(4) double convertedAmount,
      @HiveField(5) DateTime date,
      @HiveField(6) String? description,
      @HiveField(7) String? receiptPath,
      @HiveField(8) String categoryIcon,
      @HiveField(9) DateTime? createdAt,
      @HiveField(10) DateTime? updatedAt});
}

/// @nodoc
class __$$ExpenseModelImplCopyWithImpl<$Res>
    extends _$ExpenseModelCopyWithImpl<$Res, _$ExpenseModelImpl>
    implements _$$ExpenseModelImplCopyWith<$Res> {
  __$$ExpenseModelImplCopyWithImpl(
      _$ExpenseModelImpl _value, $Res Function(_$ExpenseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? amount = null,
    Object? currency = null,
    Object? convertedAmount = null,
    Object? date = null,
    Object? description = freezed,
    Object? receiptPath = freezed,
    Object? categoryIcon = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ExpenseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      convertedAmount: null == convertedAmount
          ? _value.convertedAmount
          : convertedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptPath: freezed == receiptPath
          ? _value.receiptPath
          : receiptPath // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseModelImpl implements _ExpenseModel {
  const _$ExpenseModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) required this.category,
      @HiveField(2) required this.amount,
      @HiveField(3) required this.currency,
      @HiveField(4) required this.convertedAmount,
      @HiveField(5) required this.date,
      @HiveField(6) this.description,
      @HiveField(7) this.receiptPath,
      @HiveField(8) required this.categoryIcon,
      @HiveField(9) this.createdAt,
      @HiveField(10) this.updatedAt});

  factory _$ExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String category;
  @override
  @HiveField(2)
  final double amount;
  @override
  @HiveField(3)
  final String currency;
  @override
  @HiveField(4)
  final double convertedAmount;
  @override
  @HiveField(5)
  final DateTime date;
  @override
  @HiveField(6)
  final String? description;
  @override
  @HiveField(7)
  final String? receiptPath;
  @override
  @HiveField(8)
  final String categoryIcon;
  @override
  @HiveField(9)
  final DateTime? createdAt;
  @override
  @HiveField(10)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ExpenseModel(id: $id, category: $category, amount: $amount, currency: $currency, convertedAmount: $convertedAmount, date: $date, description: $description, receiptPath: $receiptPath, categoryIcon: $categoryIcon, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.convertedAmount, convertedAmount) ||
                other.convertedAmount == convertedAmount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.receiptPath, receiptPath) ||
                other.receiptPath == receiptPath) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      amount,
      currency,
      convertedAmount,
      date,
      description,
      receiptPath,
      categoryIcon,
      createdAt,
      updatedAt);

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      __$$ExpenseModelImplCopyWithImpl<_$ExpenseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseModel implements ExpenseModel {
  const factory _ExpenseModel(
      {@HiveField(0) final int? id,
      @HiveField(1) required final String category,
      @HiveField(2) required final double amount,
      @HiveField(3) required final String currency,
      @HiveField(4) required final double convertedAmount,
      @HiveField(5) required final DateTime date,
      @HiveField(6) final String? description,
      @HiveField(7) final String? receiptPath,
      @HiveField(8) required final String categoryIcon,
      @HiveField(9) final DateTime? createdAt,
      @HiveField(10) final DateTime? updatedAt}) = _$ExpenseModelImpl;

  factory _ExpenseModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String get category;
  @override
  @HiveField(2)
  double get amount;
  @override
  @HiveField(3)
  String get currency;
  @override
  @HiveField(4)
  double get convertedAmount;
  @override
  @HiveField(5)
  DateTime get date;
  @override
  @HiveField(6)
  String? get description;
  @override
  @HiveField(7)
  String? get receiptPath;
  @override
  @HiveField(8)
  String get categoryIcon;
  @override
  @HiveField(9)
  DateTime? get createdAt;
  @override
  @HiveField(10)
  DateTime? get updatedAt;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
