// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionHistoryModel _$TransactionHistoryModelFromJson(
  Map<String, dynamic> json,
) {
  return _TransactionHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistoryModel {
  @JsonKey(name: 'data')
  PaymentData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TransactionHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionHistoryModelCopyWith<TransactionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryModelCopyWith<$Res> {
  factory $TransactionHistoryModelCopyWith(
    TransactionHistoryModel value,
    $Res Function(TransactionHistoryModel) then,
  ) = _$TransactionHistoryModelCopyWithImpl<$Res, TransactionHistoryModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'data') PaymentData? data,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'timestamp') String? timestamp,
  });

  $PaymentDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TransactionHistoryModelCopyWithImpl<
  $Res,
  $Val extends TransactionHistoryModel
>
    implements $TransactionHistoryModelCopyWith<$Res> {
  _$TransactionHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _value.copyWith(
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as PaymentData?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of TransactionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PaymentDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionHistoryModelImplCopyWith<$Res>
    implements $TransactionHistoryModelCopyWith<$Res> {
  factory _$$TransactionHistoryModelImplCopyWith(
    _$TransactionHistoryModelImpl value,
    $Res Function(_$TransactionHistoryModelImpl) then,
  ) = __$$TransactionHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'data') PaymentData? data,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'timestamp') String? timestamp,
  });

  @override
  $PaymentDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TransactionHistoryModelImplCopyWithImpl<$Res>
    extends
        _$TransactionHistoryModelCopyWithImpl<
          $Res,
          _$TransactionHistoryModelImpl
        >
    implements _$$TransactionHistoryModelImplCopyWith<$Res> {
  __$$TransactionHistoryModelImplCopyWithImpl(
    _$TransactionHistoryModelImpl _value,
    $Res Function(_$TransactionHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _$TransactionHistoryModelImpl(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as PaymentData?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionHistoryModelImpl implements _TransactionHistoryModel {
  const _$TransactionHistoryModelImpl({
    @JsonKey(name: 'data') this.data,
    @JsonKey(name: 'note') this.note,
    @JsonKey(name: 'status') this.status,
    @JsonKey(name: 'timestamp') this.timestamp,
  });

  factory _$TransactionHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryModelImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final PaymentData? data;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'timestamp')
  final String? timestamp;

  @override
  String toString() {
    return 'TransactionHistoryModel(data: $data, note: $note, status: $status, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryModelImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, note, status, timestamp);

  /// Create a copy of TransactionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryModelImplCopyWith<_$TransactionHistoryModelImpl>
  get copyWith =>
      __$$TransactionHistoryModelImplCopyWithImpl<
        _$TransactionHistoryModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryModelImplToJson(this);
  }
}

abstract class _TransactionHistoryModel implements TransactionHistoryModel {
  const factory _TransactionHistoryModel({
    @JsonKey(name: 'data') final PaymentData? data,
    @JsonKey(name: 'note') final String? note,
    @JsonKey(name: 'status') final String? status,
    @JsonKey(name: 'timestamp') final String? timestamp,
  }) = _$TransactionHistoryModelImpl;

  factory _TransactionHistoryModel.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryModelImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  PaymentData? get data;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'timestamp')
  String? get timestamp;

  /// Create a copy of TransactionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionHistoryModelImplCopyWith<_$TransactionHistoryModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
