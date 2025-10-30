// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scanner_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QrScannerState {
  bool get torchOn => throw _privateConstructorUsedError;
  CameraFacing get facing => throw _privateConstructorUsedError;
  bool get handled => throw _privateConstructorUsedError;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScannerStateCopyWith<QrScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScannerStateCopyWith<$Res> {
  factory $QrScannerStateCopyWith(
    QrScannerState value,
    $Res Function(QrScannerState) then,
  ) = _$QrScannerStateCopyWithImpl<$Res, QrScannerState>;
  @useResult
  $Res call({bool torchOn, CameraFacing facing, bool handled});
}

/// @nodoc
class _$QrScannerStateCopyWithImpl<$Res, $Val extends QrScannerState>
    implements $QrScannerStateCopyWith<$Res> {
  _$QrScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? torchOn = null,
    Object? facing = null,
    Object? handled = null,
  }) {
    return _then(
      _value.copyWith(
            torchOn: null == torchOn
                ? _value.torchOn
                : torchOn // ignore: cast_nullable_to_non_nullable
                      as bool,
            facing: null == facing
                ? _value.facing
                : facing // ignore: cast_nullable_to_non_nullable
                      as CameraFacing,
            handled: null == handled
                ? _value.handled
                : handled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QrScannerStateImplCopyWith<$Res>
    implements $QrScannerStateCopyWith<$Res> {
  factory _$$QrScannerStateImplCopyWith(
    _$QrScannerStateImpl value,
    $Res Function(_$QrScannerStateImpl) then,
  ) = __$$QrScannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool torchOn, CameraFacing facing, bool handled});
}

/// @nodoc
class __$$QrScannerStateImplCopyWithImpl<$Res>
    extends _$QrScannerStateCopyWithImpl<$Res, _$QrScannerStateImpl>
    implements _$$QrScannerStateImplCopyWith<$Res> {
  __$$QrScannerStateImplCopyWithImpl(
    _$QrScannerStateImpl _value,
    $Res Function(_$QrScannerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? torchOn = null,
    Object? facing = null,
    Object? handled = null,
  }) {
    return _then(
      _$QrScannerStateImpl(
        torchOn: null == torchOn
            ? _value.torchOn
            : torchOn // ignore: cast_nullable_to_non_nullable
                  as bool,
        facing: null == facing
            ? _value.facing
            : facing // ignore: cast_nullable_to_non_nullable
                  as CameraFacing,
        handled: null == handled
            ? _value.handled
            : handled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$QrScannerStateImpl implements _QrScannerState {
  const _$QrScannerStateImpl({
    this.torchOn = false,
    this.facing = CameraFacing.back,
    this.handled = false,
  });

  @override
  @JsonKey()
  final bool torchOn;
  @override
  @JsonKey()
  final CameraFacing facing;
  @override
  @JsonKey()
  final bool handled;

  @override
  String toString() {
    return 'QrScannerState(torchOn: $torchOn, facing: $facing, handled: $handled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScannerStateImpl &&
            (identical(other.torchOn, torchOn) || other.torchOn == torchOn) &&
            (identical(other.facing, facing) || other.facing == facing) &&
            (identical(other.handled, handled) || other.handled == handled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, torchOn, facing, handled);

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScannerStateImplCopyWith<_$QrScannerStateImpl> get copyWith =>
      __$$QrScannerStateImplCopyWithImpl<_$QrScannerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _QrScannerState implements QrScannerState {
  const factory _QrScannerState({
    final bool torchOn,
    final CameraFacing facing,
    final bool handled,
  }) = _$QrScannerStateImpl;

  @override
  bool get torchOn;
  @override
  CameraFacing get facing;
  @override
  bool get handled;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScannerStateImplCopyWith<_$QrScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
