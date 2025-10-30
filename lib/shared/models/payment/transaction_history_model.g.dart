// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryModelImpl _$$TransactionHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionHistoryModelImpl(
  data: json['data'] == null
      ? null
      : PaymentData.fromJson(json['data'] as Map<String, dynamic>),
  note: json['note'] as String?,
  status: json['status'] as String?,
  timestamp: json['timestamp'] as String?,
);

Map<String, dynamic> _$$TransactionHistoryModelImplToJson(
  _$TransactionHistoryModelImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'note': instance.note,
  'status': instance.status,
  'timestamp': instance.timestamp,
};
