import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/navigation/router.dart';
import 'package:brdz_test/features/auth/login/login_controller.dart';
import 'package:brdz_test/shared/widgets/brzd_icon.dart';
import 'package:brdz_test/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final loginController = LoginController.provider;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenLoginState();

    final (emailError, passwordError) = ref.watch(
      loginController.select(
        (value) => (value.emailError, value.passwordError),
      ),
    );

    final isPasswordVisible = ref.watch(
      loginController.select((state) => state.isPasswordVisible),
    );

    final isLoading = ref.watch(
      loginController.select((state) => state.loginResponseUiState.isLoading),
    );

    final isButtonEnabled = ref.watch(
      loginController.select((state) => state.isButtonEnabled),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.indigo.shade100],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const BrzdIcon(),
                        const SizedBox(height: 16),
                        Text(
                          context.localizations.welcome,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.localizations.signInWithYourAccount,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          forceErrorText: emailError != null
                              ? context.getString(emailError)
                              : null,
                          onChanged: (value) {
                            ref
                                .read(LoginController.provider.notifier)
                                .onEmailChanged(value);
                          },
                          decoration: InputDecoration(
                            labelText: context.localizations.email,
                            hintText: context.localizations.emailPlaceholder,
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.indigo.shade600,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !isPasswordVisible,
                          forceErrorText: passwordError != null
                              ? context.getString(passwordError)
                              : null,
                          onChanged: (value) {
                            ref
                                .read(LoginController.provider.notifier)
                                .onPasswordChanged(value);
                          },
                          decoration: InputDecoration(
                            labelText: context.localizations.password,
                            hintText: context.localizations.passwordPlaceHolder,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                ref
                                    .read(loginController.notifier)
                                    .onPasswordVisibilityChanged();
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.indigo.shade600,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    ref
                                        .read(loginController.notifier)
                                        .onSignInPressed();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    context.localizations.singIn,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.localizations.dontHaveAccount,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(AppRouter.registerRoute);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                context.localizations.signUp,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.indigo.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenLoginState() {
    ref.listen(loginController.select((value) => value.loginResponseUiState), (
      previous,
      next,
    ) {
      if (next is AsyncData) {

        context.goNamed(AppRouter.homeRoute);

        showCustomSnackBar(
          context,
          CustomSnackBar(
            message: context.localizations.loginSuccess,
            type: CustomSnackBarType.positive,
          ),
        );
      } else if (next is AsyncError) {
        showCustomSnackBar(
          context,
          CustomSnackBar(
            message: context.localizations.error,
            action: Text(context.localizations.loginFailed),
            type: CustomSnackBarType.negative,
          ),
        );
      }
    });
  }
}
