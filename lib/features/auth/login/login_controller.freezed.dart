// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginScreenUiState {
  AsyncValue<LoginResponse?> get loginResponseUiState =>
      throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get isButtonEnabled => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  UiText? get emailError => throw _privateConstructorUsedError;
  UiText? get passwordError => throw _privateConstructorUsedError;

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginScreenUiStateCopyWith<LoginScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenUiStateCopyWith<$Res> {
  factory $LoginScreenUiStateCopyWith(
    LoginScreenUiState value,
    $Res Function(LoginScreenUiState) then,
  ) = _$LoginScreenUiStateCopyWithImpl<$Res, LoginScreenUiState>;
  @useResult
  $Res call({
    AsyncValue<LoginResponse?> loginResponseUiState,
    bool isPasswordVisible,
    bool isButtonEnabled,
    String? email,
    String? password,
    UiText? emailError,
    UiText? passwordError,
  });

  $UiTextCopyWith<$Res>? get emailError;
  $UiTextCopyWith<$Res>? get passwordError;
}

/// @nodoc
class _$LoginScreenUiStateCopyWithImpl<$Res, $Val extends LoginScreenUiState>
    implements $LoginScreenUiStateCopyWith<$Res> {
  _$LoginScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginResponseUiState = null,
    Object? isPasswordVisible = null,
    Object? isButtonEnabled = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(
      _value.copyWith(
            loginResponseUiState: null == loginResponseUiState
                ? _value.loginResponseUiState
                : loginResponseUiState // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<LoginResponse?>,
            isPasswordVisible: null == isPasswordVisible
                ? _value.isPasswordVisible
                : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            isButtonEnabled: null == isButtonEnabled
                ? _value.isButtonEnabled
                : isButtonEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            emailError: freezed == emailError
                ? _value.emailError
                : emailError // ignore: cast_nullable_to_non_nullable
                      as UiText?,
            passwordError: freezed == passwordError
                ? _value.passwordError
                : passwordError // ignore: cast_nullable_to_non_nullable
                      as UiText?,
          )
          as $Val,
    );
  }

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiTextCopyWith<$Res>? get emailError {
    if (_value.emailError == null) {
      return null;
    }

    return $UiTextCopyWith<$Res>(_value.emailError!, (value) {
      return _then(_value.copyWith(emailError: value) as $Val);
    });
  }

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiTextCopyWith<$Res>? get passwordError {
    if (_value.passwordError == null) {
      return null;
    }

    return $UiTextCopyWith<$Res>(_value.passwordError!, (value) {
      return _then(_value.copyWith(passwordError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginScreenUiStateImplCopyWith<$Res>
    implements $LoginScreenUiStateCopyWith<$Res> {
  factory _$$LoginScreenUiStateImplCopyWith(
    _$LoginScreenUiStateImpl value,
    $Res Function(_$LoginScreenUiStateImpl) then,
  ) = __$$LoginScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AsyncValue<LoginResponse?> loginResponseUiState,
    bool isPasswordVisible,
    bool isButtonEnabled,
    String? email,
    String? password,
    UiText? emailError,
    UiText? passwordError,
  });

  @override
  $UiTextCopyWith<$Res>? get emailError;
  @override
  $UiTextCopyWith<$Res>? get passwordError;
}

/// @nodoc
class __$$LoginScreenUiStateImplCopyWithImpl<$Res>
    extends _$LoginScreenUiStateCopyWithImpl<$Res, _$LoginScreenUiStateImpl>
    implements _$$LoginScreenUiStateImplCopyWith<$Res> {
  __$$LoginScreenUiStateImplCopyWithImpl(
    _$LoginScreenUiStateImpl _value,
    $Res Function(_$LoginScreenUiStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginResponseUiState = null,
    Object? isPasswordVisible = null,
    Object? isButtonEnabled = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(
      _$LoginScreenUiStateImpl(
        loginResponseUiState: null == loginResponseUiState
            ? _value.loginResponseUiState
            : loginResponseUiState // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<LoginResponse?>,
        isPasswordVisible: null == isPasswordVisible
            ? _value.isPasswordVisible
            : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isButtonEnabled: null == isButtonEnabled
            ? _value.isButtonEnabled
            : isButtonEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        emailError: freezed == emailError
            ? _value.emailError
            : emailError // ignore: cast_nullable_to_non_nullable
                  as UiText?,
        passwordError: freezed == passwordError
            ? _value.passwordError
            : passwordError // ignore: cast_nullable_to_non_nullable
                  as UiText?,
      ),
    );
  }
}

/// @nodoc

class _$LoginScreenUiStateImpl implements _LoginScreenUiState {
  const _$LoginScreenUiStateImpl({
    this.loginResponseUiState = const AsyncData(null),
    this.isPasswordVisible = false,
    this.isButtonEnabled = false,
    this.email = null,
    this.password = null,
    this.emailError = null,
    this.passwordError = null,
  });

  @override
  @JsonKey()
  final AsyncValue<LoginResponse?> loginResponseUiState;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final bool isButtonEnabled;
  @override
  @JsonKey()
  final String? email;
  @override
  @JsonKey()
  final String? password;
  @override
  @JsonKey()
  final UiText? emailError;
  @override
  @JsonKey()
  final UiText? passwordError;

  @override
  String toString() {
    return 'LoginScreenUiState(loginResponseUiState: $loginResponseUiState, isPasswordVisible: $isPasswordVisible, isButtonEnabled: $isButtonEnabled, email: $email, password: $password, emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenUiStateImpl &&
            (identical(other.loginResponseUiState, loginResponseUiState) ||
                other.loginResponseUiState == loginResponseUiState) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.isButtonEnabled, isButtonEnabled) ||
                other.isButtonEnabled == isButtonEnabled) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loginResponseUiState,
    isPasswordVisible,
    isButtonEnabled,
    email,
    password,
    emailError,
    passwordError,
  );

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenUiStateImplCopyWith<_$LoginScreenUiStateImpl> get copyWith =>
      __$$LoginScreenUiStateImplCopyWithImpl<_$LoginScreenUiStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LoginScreenUiState implements LoginScreenUiState {
  const factory _LoginScreenUiState({
    final AsyncValue<LoginResponse?> loginResponseUiState,
    final bool isPasswordVisible,
    final bool isButtonEnabled,
    final String? email,
    final String? password,
    final UiText? emailError,
    final UiText? passwordError,
  }) = _$LoginScreenUiStateImpl;

  @override
  AsyncValue<LoginResponse?> get loginResponseUiState;
  @override
  bool get isPasswordVisible;
  @override
  bool get isButtonEnabled;
  @override
  String? get email;
  @override
  String? get password;
  @override
  UiText? get emailError;
  @override
  UiText? get passwordError;

  /// Create a copy of LoginScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginScreenUiStateImplCopyWith<_$LoginScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
