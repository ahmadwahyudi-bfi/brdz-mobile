import 'package:brdz_test/services/api/auth/local/auth_local_data_source.dart';
import 'package:brdz_test/services/api/auth/network/auth_network_data_source.dart';
import 'package:brdz_test/shared/models/auth/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository(this.authNetworkDataSource, this._authLocalDataSource);

  static final provider = Provider(
    (ref) => AuthRepository(
      ref.watch(AuthNetworkDataSource.provider),
      ref.watch(AuthLocalDataSource.provider),
    ),
  );

  final AuthNetworkDataSource authNetworkDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  late Stream<bool> isLoggedInStream = _authLocalDataSource
      .getAccessTokenStream()
      .map((event) => event.isEmpty)
      .where((event) => event);

  Future<bool> isLoggedIn() async {
    return (await _authLocalDataSource.getAccessToken()).isNotEmpty;
  }

  Future<String> getAccessToken() async {
    return _authLocalDataSource.getAccessToken();
  }

  Future<void> _saveTokenResponse(String token) async {
    await _authLocalDataSource.setAccessToken(token);
  }

  Future<void> clearSession() async {
    await _authLocalDataSource.setAccessToken('');
  }

  Future<LoginResponse?> login({
    required String email,
    required String password,
  }) async {
    final response = await authNetworkDataSource.login(
      email: email,
      password: password,
    );
    _saveTokenResponse(response.data?.accessToken ?? '');
    return response;
  }
}
