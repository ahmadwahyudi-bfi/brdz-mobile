import 'dart:io';

import 'package:brdz_test/core/config/network/exceptions.dart';
import 'package:brdz_test/core/config/network/http_client.dart';
import 'package:brdz_test/services/api/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthHttpClient implements HttpClient {
  AuthHttpClient(this._httpClient, this._authRepository);

  static final provider = Provider((ref) {
    return AuthHttpClient(
      ref.watch(HttpClient.provider),
      ref.watch(AuthRepository.provider),
    );
  });

  final HttpClient _httpClient;

  final AuthRepository _authRepository;

  @override
  Future<T> get<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.get(
        path: path,
        headers: {
          if (headers != null) ...headers,
          ...await _authorizationToken(),
        },
        queryParameters: queryParameters,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }

  @override
  Future<T> post<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.post(
        path: path,
        headers: {
          if (headers != null) ...headers,
          ...await _authorizationToken(),
        },
        queryParameters: queryParameters,
        body: body,
        contentType: contentType,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }

  @override
  Future<HttpResponse<T>> postV2<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.postV2(
        path: path,
        headers: {
          if (headers != null) ...headers,
          ...await _authorizationToken(),
        },
        queryParameters: queryParameters,
        body: body,
        contentType: contentType,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }

  @override
  Future<T> patch<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.patch(
        path: path,
        headers: {
          if (headers != null) ...headers,
          ...await _authorizationToken(),
        },
        queryParameters: queryParameters,
        body: body,
        contentType: contentType,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }

  @override
  Future<T> delete<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.delete(
        path: path,
        headers: {
          if (headers != null) ...headers,
          ...await _authorizationToken(),
        },
        queryParameters: queryParameters,
        body: body,
        contentType: contentType,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }

  Future<T> _clearSessionOnUnauthorized<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();

      return response;
    } on HttpStatusCodeException catch (e) {
      if (e.statusCode == HttpStatus.unauthorized) {
        await _authRepository.clearSession();
        rethrow;
      } else {
        rethrow;
      }
    }
  }

  Future<Map<String, String>> _authorizationToken() async {
    final token = await _authRepository.getAccessToken();

    return {
      if (token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }

  @override
  Future<T> put<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) async {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.put(
        path: path,
        headers: {
          if (headers != null) ...headers,
          ...await _authorizationToken(),
        },
        queryParameters: queryParameters,
        body: body,
        contentType: contentType,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }

  @override
  Future download({
    required String url,
    required String savePath,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    String? contentType,
    HttpResponseType responseType = HttpResponseType.json,
    TimeoutOptions? timeoutOptions,
  }) {
    return _clearSessionOnUnauthorized(() async {
      return _httpClient.download(
        url: url,
        savePath: savePath,
        queryParameters: queryParameters,
        headers: headers,
        contentType: contentType,
        responseType: responseType,
        timeoutOptions: timeoutOptions,
      );
    });
  }
}
