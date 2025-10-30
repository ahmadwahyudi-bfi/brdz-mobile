import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';

part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'timestamp') String? timestamp,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, Object?> json) =>
      _$ErrorResponseFromJson(json);
}
