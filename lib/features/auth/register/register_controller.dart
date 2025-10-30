import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/utils/guard_log.dart';
import 'package:brdz_test/services/api/auth/auth_repository.dart';
import 'package:brdz_test/shared/models/auth/register_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_controller.freezed.dart';

class RegisterController extends StateNotifier<RegisterScreenUiState> {
  RegisterController(this._authRepository)
    : super(const RegisterScreenUiState());

  static final provider =
      StateNotifierProvider.autoDispose<
        RegisterController,
        RegisterScreenUiState
      >((ref) {
        return RegisterController(ref.watch(AuthRepository.provider));
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
    } else if (value.length < 8) {
      error = UiText.localized(
        (localizations) => localizations.passwordMinLength,
      );
    }
    state = state.copyWith(passwordError: error);

    // Re-validate confirm password when password changes
    if (state.confirmPassword != null) {
      _validateConfirmPassword(state.confirmPassword);
    }

    _validateButtonEnabled();
  }

  void _validateConfirmPassword(String? value) {
    UiText? error;
    if (value == null || value.isEmpty) {
      error = UiText.localized(
        (localizations) => localizations.confirmPasswordIsRequired,
      );
    } else if (value != state.password) {
      error = UiText.localized(
        (localizations) => localizations.passwordNotMatch,
      );
    }
    state = state.copyWith(confirmPasswordError: error);
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

  void onConfirmPasswordChanged(String? confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
    _validateConfirmPassword(confirmPassword);
  }

  void onPasswordVisibilityChanged() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void onConfirmPasswordVisibilityChanged() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
  }

  void _validateButtonEnabled() {
    final isEnabled =
        state.emailError == null &&
        state.passwordError == null &&
        state.confirmPasswordError == null &&
        state.email != null &&
        state.password != null &&
        state.confirmPassword != null;
    state = state.copyWith(isButtonEnabled: isEnabled);
  }

  Future<void> onRegisterPressed() async {
    state = state.copyWith(registerResponseUiState: const AsyncLoading());
    await Future.delayed(const Duration(milliseconds: 400));
    state = state.copyWith(
      registerResponseUiState: const AsyncData(
        RegisterResponse(message: 'success', success: true),
      ),
    );
  }
}

@freezed
class RegisterScreenUiState with _$RegisterScreenUiState {
  const factory RegisterScreenUiState({
    @Default(AsyncData(null))
    AsyncValue<RegisterResponse?> registerResponseUiState,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @Default(false) bool isButtonEnabled,
    @Default(null) String? email,
    @Default(null) String? password,
    @Default(null) String? confirmPassword,
    @Default(null) UiText? emailError,
    @Default(null) UiText? passwordError,
    @Default(null) UiText? confirmPasswordError,
  }) = _RegisterScreenUiState;
}
