// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterResponseImpl(
  message: json['message'] as String,
  success: json['success'] as bool,
  userId: json['userId'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$$RegisterResponseImplToJson(
  _$RegisterResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'userId': instance.userId,
  'email': instance.email,
};
