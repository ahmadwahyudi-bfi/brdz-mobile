import 'package:brdz_test/core/config/network/http_client.dart';
import 'package:brdz_test/core/constants/endpoint.dart';
import 'package:brdz_test/core/utils/error_parser.dart';
import 'package:brdz_test/shared/models/auth/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNetworkDataSource {
  AuthNetworkDataSource(
    this._nonAuthClient,
  );

  static final provider = Provider((ref) {
    return AuthNetworkDataSource(
      ref.watch(HttpClient.provider),
    );
  });

  final HttpClient _nonAuthClient;

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };

    // mock response if email == test@gmail.com just for testing
    if (email == 'test@gmail.com' && password == 'Password1') {

      await Future.delayed(const Duration(milliseconds: 400));

      final mockJson = <String, dynamic>{
        'success': true,
        'message': 'OK',
        'data': {
          'access_token': 'mock.access.token.for.testing.only',
          'user': {
            'id': 'u_test_001',
            'email': email,
            'role': {
              'id': 'role_01',
              'name': 'Admin',
              'slug': 'admin',
            },
            'created_at': '2025-10-29T12:00:00.000Z',
            'updated_at': '2025-10-29T12:00:00.000Z',
          },
        },
        'timestamp': DateTime.now().toIso8601String(),
      };

      return LoginResponse.fromJson(mockJson);
    }

    final response = await catchWithException(
      () => _nonAuthClient.post<Map<String, dynamic>>(
        path: Endpoint.login,
        body: body,
      ),
    );

    return LoginResponse.fromJson(response);
  }
}
