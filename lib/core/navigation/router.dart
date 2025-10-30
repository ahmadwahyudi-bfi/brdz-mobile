import 'package:brdz_test/core/app_screen.dart';
import 'package:brdz_test/core/navigation/navigation_service.dart';
import 'package:brdz_test/core/navigation/top_level.dart';
import 'package:brdz_test/features/auth/login/login_screen.dart';
import 'package:brdz_test/features/auth/register/register_screen.dart';
import 'package:brdz_test/features/home/home_screen.dart';
import 'package:brdz_test/features/payment/payment_confirmation/payment_confirmation_screen.dart';
import 'package:brdz_test/features/splash/splash_screen.dart';
import 'package:brdz_test/features/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRouter {
  AppRouter();

  static final provider = Provider((ref) => AppRouter());

  static final _topLevelPageKey = UniqueKey();

  static const splashRoute = 'splash';
  static const loginRoute = 'login';
  static const registerRoute = 'register';
  static const selectAccountRoute = 'transaction';
  static const homeRoute = 'home';
  static const transactionRoute = 'transaction';
  static const walletRoute = 'wallet';
  static const paymentRoute = 'payment';
  static const paymentConfirmationRoute = 'payment-confirmation';

  late final router = GoRouter(
    navigatorKey: NavigationService.instance.navigationKey,
    initialLocation: '/$splashRoute',
    routes: [
      ShellRoute(
        observers: [routeObserver],
        builder: (context, state, child) {
          return HeroControllerScope(
            controller: MaterialApp.createMaterialHeroController(),
            child: AppScreen(child: child),
          );
        },
        routes: [
          GoRoute(
            name: splashRoute,
            path: '/$splashRoute',
            builder: (context, state) {
              return const SplashScreen();
            },
          ),
          GoRoute(
            name: loginRoute,
            path: '/$loginRoute',
            builder: (context, state) {
              return const LoginScreen();
            },
            routes: [
              GoRoute(
                name: registerRoute,
                path: registerRoute,
                builder: (context, state) {
                  return const RegisterScreen();
                },
              ),
            ],
          ),
          GoRoute(
            name: homeRoute,
            path: '/$homeRoute',
            pageBuilder: (context, state) {
              return _topLevelPage(context, TopLevelTab.home);
            },
          ),
          GoRoute(
            name: paymentRoute,
            path: '/$paymentRoute',
            pageBuilder: (context, state) {
              return _topLevelPage(context, TopLevelTab.payment);
            },
          ),
          GoRoute(
            name: walletRoute,
            path: '/$walletRoute',
            pageBuilder: (context, state) {
              return _topLevelPage(context, TopLevelTab.wallet);
            },
          ),
          GoRoute(
            name: paymentConfirmationRoute,
            path: '/$paymentConfirmationRoute',
            builder: (context, state) {
              final data = state.extra! as String;
              return PaymentConfirmationScreen(data: data);
            },
          ),
        ],
      ),
    ],
  );

  Page<void> _topLevelPage(BuildContext context, TopLevelTab tab) {
    return MaterialPage(
      key: _topLevelPageKey,
      child: TopLevelScreen(
        tab: tab,
        onTabChanged: (tab) {
          context.goNamed(tab.route);
        },
        children: TopLevelTab.values.map((tab) {
          switch (tab) {
            case TopLevelTab.home:
              return const HomeScreen();
            case TopLevelTab.payment:
              return const Center(child: Text('payment'));
            case TopLevelTab.wallet:
              return const WalletScreen();
          }
        }).toList(),
      ),
    );
  }
}
