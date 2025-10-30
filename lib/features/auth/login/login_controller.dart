import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/utils/guard_log.dart';
import 'package:brdz_test/services/api/auth/auth_repository.dart';
import 'package:brdz_test/shared/models/auth/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_controller.freezed.dart';

class LoginController extends StateNotifier<LoginScreenUiState> {
  LoginController(this._authRepository)
    : super(const LoginScreenUiState());

  static final provider =
      StateNotifierProvider.autoDispose<LoginController, LoginScreenUiState>((
        ref,
      ) {
        return LoginController(
          ref.watch(AuthRepository.provider),
        );
      });

  final AuthRepository _authRepository;

  void _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    UiText? error;
    if (value == null || value.isEmpty) {
      error = UiText.localized(
        (localizations) => localizations.emailIsRequired,
      );
    } else if (!emailRegex.hasMatch(value)) {
      error = UiText.localized((localizations) => localizations.emailNotValid);
    }
    state = state.copyWith(emailError: error);
    _validateButtonEnabled();
  }

  void _validatePassword(String? value) {
    UiText? error;
    if (value == null || value.isEmpty) {
      error = UiText.localized(
        (localizations) => localizations.passwordIsRequired,
      );
    }
    state = state.copyWith(passwordError: error);
    _validateButtonEnabled();
  }

  void onEmailChanged(String? email) {
    state = state.copyWith(email: email);
    _validateEmail(email);
  }

  void onPasswordChanged(String? password) {
    state = state.copyWith(password: password);
    _validatePassword(password);
  }

  void onPasswordVisibilityChanged() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void _validateButtonEnabled() {
    final isEnabled =
        state.emailError == null &&
        state.passwordError == null &&
        state.email != null &&
        state.password != null;
    state = state.copyWith(isButtonEnabled: isEnabled);
  }

  Future<void> onSignInPressed() async {
    state = state.copyWith(loginResponseUiState: const AsyncLoading());

    final result = await guardLog(
      () => _authRepository.login(email: state.email!, password: state.password!),
    );

    result.when(
      data: (data) {
        state = state.copyWith(loginResponseUiState: AsyncData(data));
      },
      error: (e, s) {
        state = state.copyWith(loginResponseUiState: AsyncError(e, s));
      },
      loading: () {},
    );
  }
}

@freezed
class LoginScreenUiState with _$LoginScreenUiState {
  const factory LoginScreenUiState({
    @Default(AsyncData(null)) AsyncValue<LoginResponse?> loginResponseUiState,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isButtonEnabled,
    @Default(null) String? email,
    @Default(null) String? password,
    @Default(null) UiText? emailError,
    @Default(null) UiText? passwordError,
  }) = _LoginScreenUiState;
}
