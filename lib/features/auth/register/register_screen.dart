import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/features/auth/register/register_controller.dart';
import 'package:brdz_test/shared/widgets/brzd_icon.dart';
import 'package:brdz_test/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final registerController = RegisterController.provider;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenRegisterState();

    final (emailError, passwordError, confirmPasswordError) = ref.watch(
      registerController.select(
            (value) => (
        value.emailError,
        value.passwordError,
        value.confirmPasswordError,
        ),
      ),
    );

    final isPasswordVisible = ref.watch(
      registerController.select((state) => state.isPasswordVisible),
    );

    final isConfirmPasswordVisible = ref.watch(
      registerController.select((state) => state.isConfirmPasswordVisible),
    );

    final isLoading = ref.watch(
      registerController.select(
            (state) => state.registerResponseUiState.isLoading,
      ),
    );

    final isButtonEnabled = ref.watch(
      registerController.select((state) => state.isButtonEnabled),
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
                          context.localizations.createAccount,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.localizations.signUpDescription,
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
                                .read(RegisterController.provider.notifier)
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
                                .read(RegisterController.provider.notifier)
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
                                    .read(registerController.notifier)
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
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !isConfirmPasswordVisible,
                          forceErrorText: confirmPasswordError != null
                              ? context.getString(confirmPasswordError)
                              : null,
                          onChanged: (value) {
                            ref
                                .read(RegisterController.provider.notifier)
                                .onConfirmPasswordChanged(value);
                          },
                          decoration: InputDecoration(
                            labelText: context.localizations.confirmPassword,
                            hintText:
                            context.localizations.confirmPasswordPlaceholder,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                ref
                                    .read(registerController.notifier)
                                    .onConfirmPasswordVisibilityChanged();
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
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                              ref
                                  .read(registerController.notifier)
                                  .onRegisterPressed();
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
                              context.localizations.register,
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
                              context.localizations.alreadyHaveAccount,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                context.localizations.singIn,
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

  void _listenRegisterState() {
    ref.listen(
      registerController.select((value) => value.registerResponseUiState),
          (previous, next) {
        if (next is AsyncData) {
          showCustomSnackBar(
            context,
            CustomSnackBar(
              message: context.localizations.registerSuccess,
              type: CustomSnackBarType.positive,
            ),
          );

          // Navigate back to login screen
          context.pop();
        } else if (next is AsyncError) {
          showCustomSnackBar(
            context,
            CustomSnackBar(
              message: context.localizations.registerFailed,
              type: CustomSnackBarType.negative,
            ),
          );
        }
      },
    );
  }
}
