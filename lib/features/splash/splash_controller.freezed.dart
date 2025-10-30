// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SplashScreenUiState {
  bool? get isLoggedIn => throw _privateConstructorUsedError;

  /// Create a copy of SplashScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashScreenUiStateCopyWith<SplashScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashScreenUiStateCopyWith<$Res> {
  factory $SplashScreenUiStateCopyWith(
    SplashScreenUiState value,
    $Res Function(SplashScreenUiState) then,
  ) = _$SplashScreenUiStateCopyWithImpl<$Res, SplashScreenUiState>;
  @useResult
  $Res call({bool? isLoggedIn});
}

/// @nodoc
class _$SplashScreenUiStateCopyWithImpl<$Res, $Val extends SplashScreenUiState>
    implements $SplashScreenUiStateCopyWith<$Res> {
  _$SplashScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoggedIn = freezed}) {
    return _then(
      _value.copyWith(
            isLoggedIn: freezed == isLoggedIn
                ? _value.isLoggedIn
                : isLoggedIn // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SplashScreenUiStateImplCopyWith<$Res>
    implements $SplashScreenUiStateCopyWith<$Res> {
  factory _$$SplashScreenUiStateImplCopyWith(
    _$SplashScreenUiStateImpl value,
    $Res Function(_$SplashScreenUiStateImpl) then,
  ) = __$$SplashScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isLoggedIn});
}

/// @nodoc
class __$$SplashScreenUiStateImplCopyWithImpl<$Res>
    extends _$SplashScreenUiStateCopyWithImpl<$Res, _$SplashScreenUiStateImpl>
    implements _$$SplashScreenUiStateImplCopyWith<$Res> {
  __$$SplashScreenUiStateImplCopyWithImpl(
    _$SplashScreenUiStateImpl _value,
    $Res Function(_$SplashScreenUiStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoggedIn = freezed}) {
    return _then(
      _$SplashScreenUiStateImpl(
        isLoggedIn: freezed == isLoggedIn
            ? _value.isLoggedIn
            : isLoggedIn // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc

class _$SplashScreenUiStateImpl implements _SplashScreenUiState {
  const _$SplashScreenUiStateImpl({this.isLoggedIn = null});

  @override
  @JsonKey()
  final bool? isLoggedIn;

  @override
  String toString() {
    return 'SplashScreenUiState(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashScreenUiStateImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn);

  /// Create a copy of SplashScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashScreenUiStateImplCopyWith<_$SplashScreenUiStateImpl> get copyWith =>
      __$$SplashScreenUiStateImplCopyWithImpl<_$SplashScreenUiStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SplashScreenUiState implements SplashScreenUiState {
  const factory _SplashScreenUiState({final bool? isLoggedIn}) =
      _$SplashScreenUiStateImpl;

  @override
  bool? get isLoggedIn;

  /// Create a copy of SplashScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashScreenUiStateImplCopyWith<_$SplashScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
