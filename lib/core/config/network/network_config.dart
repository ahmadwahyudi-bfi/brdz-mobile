import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkConfig {
  const NetworkConfig({
    required this.apiScheme,
    required this.apiHost,
    required this.apiPort,
    required this.sha256Fingerprint,
  });

  static final provider = Provider<NetworkConfig>(
    (ref) {
      throw UnimplementedError(
        'NetworkConfig is not provided in the main function',
      );
    },
  );

  final String apiScheme;

  final String apiHost;

  final String apiPort;

  final String sha256Fingerprint;
}
