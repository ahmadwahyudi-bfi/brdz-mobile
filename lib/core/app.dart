import 'package:brdz_test/core/localizations/app_localizations.dart';
import 'package:brdz_test/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.watch(AppRouter.provider).router,
      locale: const Locale('en'),
      supportedLocales: const [...AppLocalizations.supportedLocales],
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
      ],
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
