// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_confirmation_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentConfirmationState {
  PaymentData? get paymentData => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  bool get submitSuccess => throw _privateConstructorUsedError;

  /// Create a copy of PaymentConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentConfirmationStateCopyWith<PaymentConfirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentConfirmationStateCopyWith<$Res> {
  factory $PaymentConfirmationStateCopyWith(
    PaymentConfirmationState value,
    $Res Function(PaymentConfirmationState) then,
  ) = _$PaymentConfirmationStateCopyWithImpl<$Res, PaymentConfirmationState>;
  @useResult
  $Res call({PaymentData? paymentData, String note, bool submitSuccess});

  $PaymentDataCopyWith<$Res>? get paymentData;
}

/// @nodoc
class _$PaymentConfirmationStateCopyWithImpl<
  $Res,
  $Val extends PaymentConfirmationState
>
    implements $PaymentConfirmationStateCopyWith<$Res> {
  _$PaymentConfirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentData = freezed,
    Object? note = null,
    Object? submitSuccess = null,
  }) {
    return _then(
      _value.copyWith(
            paymentData: freezed == paymentData
                ? _value.paymentData
                : paymentData // ignore: cast_nullable_to_non_nullable
                      as PaymentData?,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
            submitSuccess: null == submitSuccess
                ? _value.submitSuccess
                : submitSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of PaymentConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentDataCopyWith<$Res>? get paymentData {
    if (_value.paymentData == null) {
      return null;
    }

    return $PaymentDataCopyWith<$Res>(_value.paymentData!, (value) {
      return _then(_value.copyWith(paymentData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentConfirmationStateImplCopyWith<$Res>
    implements $PaymentConfirmationStateCopyWith<$Res> {
  factory _$$PaymentConfirmationStateImplCopyWith(
    _$PaymentConfirmationStateImpl value,
    $Res Function(_$PaymentConfirmationStateImpl) then,
  ) = __$$PaymentConfirmationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentData? paymentData, String note, bool submitSuccess});

  @override
  $PaymentDataCopyWith<$Res>? get paymentData;
}

/// @nodoc
class __$$PaymentConfirmationStateImplCopyWithImpl<$Res>
    extends
        _$PaymentConfirmationStateCopyWithImpl<
          $Res,
          _$PaymentConfirmationStateImpl
        >
    implements _$$PaymentConfirmationStateImplCopyWith<$Res> {
  __$$PaymentConfirmationStateImplCopyWithImpl(
    _$PaymentConfirmationStateImpl _value,
    $Res Function(_$PaymentConfirmationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentData = freezed,
    Object? note = null,
    Object? submitSuccess = null,
  }) {
    return _then(
      _$PaymentConfirmationStateImpl(
        paymentData: freezed == paymentData
            ? _value.paymentData
            : paymentData // ignore: cast_nullable_to_non_nullable
                  as PaymentData?,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
        submitSuccess: null == submitSuccess
            ? _value.submitSuccess
            : submitSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$PaymentConfirmationStateImpl implements _PaymentConfirmationState {
  const _$PaymentConfirmationStateImpl({
    this.paymentData = null,
    this.note = '',
    this.submitSuccess = false,
  });

  @override
  @JsonKey()
  final PaymentData? paymentData;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final bool submitSuccess;

  @override
  String toString() {
    return 'PaymentConfirmationState(paymentData: $paymentData, note: $note, submitSuccess: $submitSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentConfirmationStateImpl &&
            (identical(other.paymentData, paymentData) ||
                other.paymentData == paymentData) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.submitSuccess, submitSuccess) ||
                other.submitSuccess == submitSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentData, note, submitSuccess);

  /// Create a copy of PaymentConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentConfirmationStateImplCopyWith<_$PaymentConfirmationStateImpl>
  get copyWith =>
      __$$PaymentConfirmationStateImplCopyWithImpl<
        _$PaymentConfirmationStateImpl
      >(this, _$identity);
}

abstract class _PaymentConfirmationState implements PaymentConfirmationState {
  const factory _PaymentConfirmationState({
    final PaymentData? paymentData,
    final String note,
    final bool submitSuccess,
  }) = _$PaymentConfirmationStateImpl;

  @override
  PaymentData? get paymentData;
  @override
  String get note;
  @override
  bool get submitSuccess;

  /// Create a copy of PaymentConfirmationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentConfirmationStateImplCopyWith<_$PaymentConfirmationStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
