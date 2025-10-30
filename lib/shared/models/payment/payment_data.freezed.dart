// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) {
  return _PaymentData.fromJson(json);
}

/// @nodoc
mixin _$PaymentData {
  @JsonKey(name: 'merchant_name')
  String? get merchantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchant_address')
  String? get merchantAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee')
  int? get fee => throw _privateConstructorUsedError;

  /// Serializes this PaymentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDataCopyWith<PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataCopyWith<$Res> {
  factory $PaymentDataCopyWith(
    PaymentData value,
    $Res Function(PaymentData) then,
  ) = _$PaymentDataCopyWithImpl<$Res, PaymentData>;
  @useResult
  $Res call({
    @JsonKey(name: 'merchant_name') String? merchantName,
    @JsonKey(name: 'merchant_address') String? merchantAddress,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'fee') int? fee,
  });
}

/// @nodoc
class _$PaymentDataCopyWithImpl<$Res, $Val extends PaymentData>
    implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantName = freezed,
    Object? merchantAddress = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
  }) {
    return _then(
      _value.copyWith(
            merchantName: freezed == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            merchantAddress: freezed == merchantAddress
                ? _value.merchantAddress
                : merchantAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            amount: freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as int?,
            fee: freezed == fee
                ? _value.fee
                : fee // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentDataImplCopyWith<$Res>
    implements $PaymentDataCopyWith<$Res> {
  factory _$$PaymentDataImplCopyWith(
    _$PaymentDataImpl value,
    $Res Function(_$PaymentDataImpl) then,
  ) = __$$PaymentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'merchant_name') String? merchantName,
    @JsonKey(name: 'merchant_address') String? merchantAddress,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'fee') int? fee,
  });
}

/// @nodoc
class __$$PaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataCopyWithImpl<$Res, _$PaymentDataImpl>
    implements _$$PaymentDataImplCopyWith<$Res> {
  __$$PaymentDataImplCopyWithImpl(
    _$PaymentDataImpl _value,
    $Res Function(_$PaymentDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantName = freezed,
    Object? merchantAddress = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
  }) {
    return _then(
      _$PaymentDataImpl(
        merchantName: freezed == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        merchantAddress: freezed == merchantAddress
            ? _value.merchantAddress
            : merchantAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        amount: freezed == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as int?,
        fee: freezed == fee
            ? _value.fee
            : fee // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDataImpl implements _PaymentData {
  const _$PaymentDataImpl({
    @JsonKey(name: 'merchant_name') this.merchantName,
    @JsonKey(name: 'merchant_address') this.merchantAddress,
    @JsonKey(name: 'amount') this.amount,
    @JsonKey(name: 'fee') this.fee,
  });

  factory _$PaymentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDataImplFromJson(json);

  @override
  @JsonKey(name: 'merchant_name')
  final String? merchantName;
  @override
  @JsonKey(name: 'merchant_address')
  final String? merchantAddress;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'fee')
  final int? fee;

  @override
  String toString() {
    return 'PaymentData(merchantName: $merchantName, merchantAddress: $merchantAddress, amount: $amount, fee: $fee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDataImpl &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.merchantAddress, merchantAddress) ||
                other.merchantAddress == merchantAddress) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, merchantName, merchantAddress, amount, fee);

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      __$$PaymentDataImplCopyWithImpl<_$PaymentDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDataImplToJson(this);
  }
}

abstract class _PaymentData implements PaymentData {
  const factory _PaymentData({
    @JsonKey(name: 'merchant_name') final String? merchantName,
    @JsonKey(name: 'merchant_address') final String? merchantAddress,
    @JsonKey(name: 'amount') final int? amount,
    @JsonKey(name: 'fee') final int? fee,
  }) = _$PaymentDataImpl;

  factory _PaymentData.fromJson(Map<String, dynamic> json) =
      _$PaymentDataImpl.fromJson;

  @override
  @JsonKey(name: 'merchant_name')
  String? get merchantName;
  @override
  @JsonKey(name: 'merchant_address')
  String? get merchantAddress;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'fee')
  int? get fee;

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
