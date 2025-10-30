import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_data.freezed.dart';
part 'payment_data.g.dart';

@freezed
abstract class PaymentData with _$PaymentData {
  const factory PaymentData({
    @JsonKey(name: 'merchant_name') String? merchantName,
    @JsonKey(name: 'merchant_address') String? merchantAddress,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'fee') int? fee,
  }) = _PaymentData;

  factory PaymentData.fromJson(Map<String, dynamic> json) => _$PaymentDataFromJson(json);
}

