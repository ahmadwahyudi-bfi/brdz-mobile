import 'package:brdz_test/shared/models/payment/payment_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';

@freezed
abstract class TransactionHistoryModel with _$TransactionHistoryModel {
  const factory TransactionHistoryModel({
    @JsonKey(name: 'data') PaymentData? data,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'timestamp') String? timestamp,
  }) = _TransactionHistoryModel;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => _$TransactionHistoryModelFromJson(json);
}

