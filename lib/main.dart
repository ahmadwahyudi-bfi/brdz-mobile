import 'package:brdz_test/core/app.dart';
import 'package:brdz_test/core/config/network/http_client.dart';
import 'package:brdz_test/core/config/network/network_config.dart';
import 'package:brdz_test/core/utils/cryptoghrapy.dart';
import 'package:brdz_test/services/api/auth/auth_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  mainWithConfig();
}

const _networkConfig = NetworkConfig(
  apiScheme:  String.fromEnvironment('API_SCHEME'),
  apiHost:  String.fromEnvironment('API_HOST'),
  apiPort:  String.fromEnvironment('API_PORT'),
  // for ssl pinning purposes
  sha256Fingerprint:  String.fromEnvironment('SHA_256_FINGERPRINT'),
);

Future<void> mainWithConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    ProviderScope(
      overrides: [
        HttpClient.authProvider.overrideWith(
              (ref) => ref.watch(AuthHttpClient.provider),
        ),
        NetworkConfig.provider.overrideWithValue(_networkConfig),
      ],
      child: const App(),
    ),
  );
}
