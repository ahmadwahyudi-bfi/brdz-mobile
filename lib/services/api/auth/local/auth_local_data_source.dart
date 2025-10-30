import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _accessTokenKey = 'atk';
const _refreshTokenKey = 'rtk';
const _accessTokenExpirationTimeKey = 'atetk';
const _refreshTokenExpirationTimeKey = 'rtetk';
const _hasSessionEndedByExpiryKey = 'hsebek';

class AuthLocalDataSource {
  AuthLocalDataSource(this._secureStorage);

  static final provider = Provider(
        (ref) {
      return AuthLocalDataSource(const FlutterSecureStorage());
    },
  );

  final FlutterSecureStorage _secureStorage;

  final StreamController<String> _accessTokenStreamController =
  StreamController.broadcast();

  Future<String> getAccessToken() async {
    return (await _secureStorage.read(key: _accessTokenKey)) ?? '';
  }

  Stream<String> getAccessTokenStream() {
    return _accessTokenStreamController.stream;
  }

  Future<void> setAccessToken(String token) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
    _accessTokenStreamController.add(token);
  }

  Future<String> getRefreshToken() async {
    return (await _secureStorage.read(key: _refreshTokenKey)) ?? '';
  }

  Future<void> setRefreshToken(String token) async {
    await _secureStorage.write(key: _refreshTokenKey, value: token);
  }

  Future<String> getAccessTokenExpirationTime() async {
    return (await _secureStorage.read(key: _accessTokenExpirationTimeKey)) ??
        '';
  }

  Future<void> setAccessTokenExpirationTime(String time) async {
    await _secureStorage.write(key: _accessTokenExpirationTimeKey, value: time);
  }

  Future<String> getRefreshTokenExpirationTime() async {
    return (await _secureStorage.read(key: _refreshTokenExpirationTimeKey)) ??
        '';
  }

  Future<void> setRefreshTokenExpirationTime(String time) async {
    await _secureStorage.write(
      key: _refreshTokenExpirationTimeKey,
      value: time,
    );
  }

  Future<bool> hasSessionEndedByExpiry() async {
    return (await _secureStorage.read(key: _hasSessionEndedByExpiryKey))
        ?.toBoolean() ??
        false;
  }

  Future<void> setSessionEndedByExpiry({required bool endedByExpiry}) async {
    await _secureStorage.write(
      key: _hasSessionEndedByExpiryKey,
      value: endedByExpiry.toString(),
    );
  }
}

extension StringToBoolean on String {
  bool toBoolean() {
    return toLowerCase() == 'true';
  }
}
