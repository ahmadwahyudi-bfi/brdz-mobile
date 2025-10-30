import 'package:brdz_test/services/api/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_controller.freezed.dart';

class SplashController extends StateNotifier<SplashScreenUiState> {
  SplashController(this._authRepository) : super(const SplashScreenUiState());

  static final provider =
  StateNotifierProvider.autoDispose<SplashController, SplashScreenUiState>((
      ref,
      ) {
    return SplashController(ref.watch(AuthRepository.provider));
  });

  final AuthRepository _authRepository;

  Future<void> onScreenLoaded() async {
    //delay for splash screen
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await _authRepository.isLoggedIn();

    if (!mounted) return;
    if (!isLoggedIn) {
      state = state.copyWith(isLoggedIn: false);
    } else {
      state = state.copyWith(isLoggedIn: true);
    }
  }
}

@freezed
class SplashScreenUiState with _$SplashScreenUiState {
  const factory SplashScreenUiState({@Default(null) bool? isLoggedIn}) =
  _SplashScreenUiState;
}
