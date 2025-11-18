// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_filter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseFilterEntity _$ExpenseFilterEntityFromJson(Map<String, dynamic> json) {
  return _ExpenseFilterEntity.fromJson(json);
}

/// @nodoc
mixin _$ExpenseFilterEntity {
  String get period =>
      throw _privateConstructorUsedError; // 'all', 'week', 'month'
  String? get category => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this ExpenseFilterEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseFilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseFilterEntityCopyWith<ExpenseFilterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFilterEntityCopyWith<$Res> {
  factory $ExpenseFilterEntityCopyWith(
          ExpenseFilterEntity value, $Res Function(ExpenseFilterEntity) then) =
      _$ExpenseFilterEntityCopyWithImpl<$Res, ExpenseFilterEntity>;
  @useResult
  $Res call(
      {String period,
      String? category,
      DateTime? startDate,
      DateTime? endDate,
      int page,
      int limit});
}

/// @nodoc
class _$ExpenseFilterEntityCopyWithImpl<$Res, $Val extends ExpenseFilterEntity>
    implements $ExpenseFilterEntityCopyWith<$Res> {
  _$ExpenseFilterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseFilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? category = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseFilterEntityImplCopyWith<$Res>
    implements $ExpenseFilterEntityCopyWith<$Res> {
  factory _$$ExpenseFilterEntityImplCopyWith(_$ExpenseFilterEntityImpl value,
          $Res Function(_$ExpenseFilterEntityImpl) then) =
      __$$ExpenseFilterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      String? category,
      DateTime? startDate,
      DateTime? endDate,
      int page,
      int limit});
}

/// @nodoc
class __$$ExpenseFilterEntityImplCopyWithImpl<$Res>
    extends _$ExpenseFilterEntityCopyWithImpl<$Res, _$ExpenseFilterEntityImpl>
    implements _$$ExpenseFilterEntityImplCopyWith<$Res> {
  __$$ExpenseFilterEntityImplCopyWithImpl(_$ExpenseFilterEntityImpl _value,
      $Res Function(_$ExpenseFilterEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseFilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? category = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$ExpenseFilterEntityImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseFilterEntityImpl implements _ExpenseFilterEntity {
  const _$ExpenseFilterEntityImpl(
      {this.period = 'all',
      this.category,
      this.startDate,
      this.endDate,
      this.page = 1,
      this.limit = 10});

  factory _$ExpenseFilterEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseFilterEntityImplFromJson(json);

  @override
  @JsonKey()
  final String period;
// 'all', 'week', 'month'
  @override
  final String? category;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'ExpenseFilterEntity(period: $period, category: $category, startDate: $startDate, endDate: $endDate, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseFilterEntityImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, period, category, startDate, endDate, page, limit);

  /// Create a copy of ExpenseFilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseFilterEntityImplCopyWith<_$ExpenseFilterEntityImpl> get copyWith =>
      __$$ExpenseFilterEntityImplCopyWithImpl<_$ExpenseFilterEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseFilterEntityImplToJson(
      this,
    );
  }
}

abstract class _ExpenseFilterEntity implements ExpenseFilterEntity {
  const factory _ExpenseFilterEntity(
      {final String period,
      final String? category,
      final DateTime? startDate,
      final DateTime? endDate,
      final int page,
      final int limit}) = _$ExpenseFilterEntityImpl;

  factory _ExpenseFilterEntity.fromJson(Map<String, dynamic> json) =
      _$ExpenseFilterEntityImpl.fromJson;

  @override
  String get period; // 'all', 'week', 'month'
  @override
  String? get category;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  int get page;
  @override
  int get limit;

  /// Create a copy of ExpenseFilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseFilterEntityImplCopyWith<_$ExpenseFilterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
