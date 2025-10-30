import 'package:brdz_test/core/navigation/router.dart';
import 'package:brdz_test/features/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onScreenLoaded();
    });
  }

  void _onScreenLoaded() {
    ref.read(SplashController.provider.notifier).onScreenLoaded();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(SplashController.provider.select((state) => state.isLoggedIn), (
        previous,
        next,
        ) {
      if (next == true) {
        context.goNamed(AppRouter.homeRoute);
      } else {
        context.goNamed(AppRouter.loginRoute);
      }
    });

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
          child: Hero(
            tag: 'logo',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Text(
                'B',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
