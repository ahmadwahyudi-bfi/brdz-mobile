import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') LoginData? data,
    @JsonKey(name: 'timestamp') String? timestamp,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'user') UserResponse? user,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, Object?> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'role') RoleResponse? role,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, Object?> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class RoleResponse with _$RoleResponse {
  const factory RoleResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'slug') String? slug,
  }) = _RoleResponse;

  factory RoleResponse.fromJson(Map<String, Object?> json) =>
      _$RoleResponseFromJson(json);
}
