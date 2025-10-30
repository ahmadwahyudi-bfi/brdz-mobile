// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterScreenUiState {
  AsyncValue<RegisterResponse?> get registerResponseUiState =>
      throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get isConfirmPasswordVisible => throw _privateConstructorUsedError;
  bool get isButtonEnabled => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  UiText? get emailError => throw _privateConstructorUsedError;
  UiText? get passwordError => throw _privateConstructorUsedError;
  UiText? get confirmPasswordError => throw _privateConstructorUsedError;

  /// Create a copy of RegisterScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterScreenUiStateCopyWith<RegisterScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterScreenUiStateCopyWith<$Res> {
  factory $RegisterScreenUiStateCopyWith(
    RegisterScreenUiState value,
    $Res Function(RegisterScreenUiState) then,
  ) = _$RegisterScreenUiStateCopyWithImpl<$Res, RegisterScreenUiState>;
  @useResult
  $Res call({
    AsyncValue<RegisterResponse?> registerResponseUiState,
    bool isPasswordVisible,
    bool isConfirmPasswordVisible,
    bool isButtonEnabled,
    String? email,
    String? password,
    String? confirmPassword,
    UiText? emailError,
    UiText? passwordError,
    UiText? confirmPasswordError,
  });

  $UiTextCopyWith<$Res>? get emailError;
  $UiTextCopyWith<$Res>? get passwordError;
  $UiTextCopyWith<$Res>? get confirmPasswordError;
}

/// @nodoc
class _$RegisterScreenUiStateCopyWithImpl<
  $Res,
  $Val extends RegisterScreenUiState
>
    implements $RegisterScreenUiStateCopyWith<$Res> {
  _$RegisterScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerResponseUiState = null,
    Object? isPasswordVisible = null,
    Object? isConfirmPasswordVisible = null,
    Object? isButtonEnabled = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
  }) {
    return _then(
      _value.copyWith(
            registerResponseUiState: null == registerResponseUiState
                ? _value.registerResponseUiState
                : registerResponseUiState // ignore: cast_nullable_to_non_nullable
                      as AsyncValue<RegisterResponse?>,
            isPasswordVisible: null == isPasswordVisible
                ? _value.isPasswordVisible
                : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            isConfirmPasswordVisible: null == isConfirmPasswordVisible
                ? _value.isConfirmPasswordVisible
                : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
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
            confirmPassword: freezed == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
            emailError: freezed == emailError
                ? _value.emailError
                : emailError // ignore: cast_nullable_to_non_nullable
                      as UiText?,
            passwordError: freezed == passwordError
                ? _value.passwordError
                : passwordError // ignore: cast_nullable_to_non_nullable
                      as UiText?,
            confirmPasswordError: freezed == confirmPasswordError
                ? _value.confirmPasswordError
                : confirmPasswordError // ignore: cast_nullable_to_non_nullable
                      as UiText?,
          )
          as $Val,
    );
  }

  /// Create a copy of RegisterScreenUiState
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

  /// Create a copy of RegisterScreenUiState
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

  /// Create a copy of RegisterScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiTextCopyWith<$Res>? get confirmPasswordError {
    if (_value.confirmPasswordError == null) {
      return null;
    }

    return $UiTextCopyWith<$Res>(_value.confirmPasswordError!, (value) {
      return _then(_value.copyWith(confirmPasswordError: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterScreenUiStateImplCopyWith<$Res>
    implements $RegisterScreenUiStateCopyWith<$Res> {
  factory _$$RegisterScreenUiStateImplCopyWith(
    _$RegisterScreenUiStateImpl value,
    $Res Function(_$RegisterScreenUiStateImpl) then,
  ) = __$$RegisterScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AsyncValue<RegisterResponse?> registerResponseUiState,
    bool isPasswordVisible,
    bool isConfirmPasswordVisible,
    bool isButtonEnabled,
    String? email,
    String? password,
    String? confirmPassword,
    UiText? emailError,
    UiText? passwordError,
    UiText? confirmPasswordError,
  });

  @override
  $UiTextCopyWith<$Res>? get emailError;
  @override
  $UiTextCopyWith<$Res>? get passwordError;
  @override
  $UiTextCopyWith<$Res>? get confirmPasswordError;
}

/// @nodoc
class __$$RegisterScreenUiStateImplCopyWithImpl<$Res>
    extends
        _$RegisterScreenUiStateCopyWithImpl<$Res, _$RegisterScreenUiStateImpl>
    implements _$$RegisterScreenUiStateImplCopyWith<$Res> {
  __$$RegisterScreenUiStateImplCopyWithImpl(
    _$RegisterScreenUiStateImpl _value,
    $Res Function(_$RegisterScreenUiStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerResponseUiState = null,
    Object? isPasswordVisible = null,
    Object? isConfirmPasswordVisible = null,
    Object? isButtonEnabled = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
  }) {
    return _then(
      _$RegisterScreenUiStateImpl(
        registerResponseUiState: null == registerResponseUiState
            ? _value.registerResponseUiState
            : registerResponseUiState // ignore: cast_nullable_to_non_nullable
                  as AsyncValue<RegisterResponse?>,
        isPasswordVisible: null == isPasswordVisible
            ? _value.isPasswordVisible
            : isPasswordVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isConfirmPasswordVisible: null == isConfirmPasswordVisible
            ? _value.isConfirmPasswordVisible
            : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
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
        confirmPassword: freezed == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
        emailError: freezed == emailError
            ? _value.emailError
            : emailError // ignore: cast_nullable_to_non_nullable
                  as UiText?,
        passwordError: freezed == passwordError
            ? _value.passwordError
            : passwordError // ignore: cast_nullable_to_non_nullable
                  as UiText?,
        confirmPasswordError: freezed == confirmPasswordError
            ? _value.confirmPasswordError
            : confirmPasswordError // ignore: cast_nullable_to_non_nullable
                  as UiText?,
      ),
    );
  }
}

/// @nodoc

class _$RegisterScreenUiStateImpl implements _RegisterScreenUiState {
  const _$RegisterScreenUiStateImpl({
    this.registerResponseUiState = const AsyncData(null),
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.isButtonEnabled = false,
    this.email = null,
    this.password = null,
    this.confirmPassword = null,
    this.emailError = null,
    this.passwordError = null,
    this.confirmPasswordError = null,
  });

  @override
  @JsonKey()
  final AsyncValue<RegisterResponse?> registerResponseUiState;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final bool isConfirmPasswordVisible;
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
  final String? confirmPassword;
  @override
  @JsonKey()
  final UiText? emailError;
  @override
  @JsonKey()
  final UiText? passwordError;
  @override
  @JsonKey()
  final UiText? confirmPasswordError;

  @override
  String toString() {
    return 'RegisterScreenUiState(registerResponseUiState: $registerResponseUiState, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isButtonEnabled: $isButtonEnabled, email: $email, password: $password, confirmPassword: $confirmPassword, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterScreenUiStateImpl &&
            (identical(
                  other.registerResponseUiState,
                  registerResponseUiState,
                ) ||
                other.registerResponseUiState == registerResponseUiState) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(
                  other.isConfirmPasswordVisible,
                  isConfirmPasswordVisible,
                ) ||
                other.isConfirmPasswordVisible == isConfirmPasswordVisible) &&
            (identical(other.isButtonEnabled, isButtonEnabled) ||
                other.isButtonEnabled == isButtonEnabled) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    registerResponseUiState,
    isPasswordVisible,
    isConfirmPasswordVisible,
    isButtonEnabled,
    email,
    password,
    confirmPassword,
    emailError,
    passwordError,
    confirmPasswordError,
  );

  /// Create a copy of RegisterScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterScreenUiStateImplCopyWith<_$RegisterScreenUiStateImpl>
  get copyWith =>
      __$$RegisterScreenUiStateImplCopyWithImpl<_$RegisterScreenUiStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RegisterScreenUiState implements RegisterScreenUiState {
  const factory _RegisterScreenUiState({
    final AsyncValue<RegisterResponse?> registerResponseUiState,
    final bool isPasswordVisible,
    final bool isConfirmPasswordVisible,
    final bool isButtonEnabled,
    final String? email,
    final String? password,
    final String? confirmPassword,
    final UiText? emailError,
    final UiText? passwordError,
    final UiText? confirmPasswordError,
  }) = _$RegisterScreenUiStateImpl;

  @override
  AsyncValue<RegisterResponse?> get registerResponseUiState;
  @override
  bool get isPasswordVisible;
  @override
  bool get isConfirmPasswordVisible;
  @override
  bool get isButtonEnabled;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confirmPassword;
  @override
  UiText? get emailError;
  @override
  UiText? get passwordError;
  @override
  UiText? get confirmPasswordError;

  /// Create a copy of RegisterScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterScreenUiStateImplCopyWith<_$RegisterScreenUiStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
