// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDataImpl _$$PaymentDataImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDataImpl(
      merchantName: json['merchant_name'] as String?,
      merchantAddress: json['merchant_address'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaymentDataImplToJson(_$PaymentDataImpl instance) =>
    <String, dynamic>{
      'merchant_name': instance.merchantName,
      'merchant_address': instance.merchantAddress,
      'amount': instance.amount,
      'fee': instance.fee,
    };
