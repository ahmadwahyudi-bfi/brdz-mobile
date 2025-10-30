import 'package:brdz_test/core/utils/cryptoghrapy.dart';
import 'package:brdz_test/services/storage/transaction_history_storage.dart';
import 'package:brdz_test/shared/models/payment/payment_data.dart';
import 'package:brdz_test/shared/widgets/common/common_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_confirmation_controller.freezed.dart';

class PaymentConfirmationController
    extends StateNotifier<PaymentConfirmationState> {
  PaymentConfirmationController(this._storage, this._commonController)
    : super(const PaymentConfirmationState());

  static final provider =
      StateNotifierProvider.autoDispose<
        PaymentConfirmationController,
        PaymentConfirmationState
      >(
        (ref) => PaymentConfirmationController(
          ref.watch(TransactionHistoryStorage.provider),
          ref.watch(CommonController.provider.notifier),
        ),
      );

  final TransactionHistoryStorage _storage;
  final CommonController _commonController;

  Future<void> onScreenLoaded(String rawData) async {
    const passphrase = String.fromEnvironment('PASSPHRASE');
    final data = await decryptPayload(
      encryptedJson: rawData,
      passphrase: passphrase,
    );

    final paymentData = PaymentData.fromJson(data);

    state = state.copyWith(paymentData: paymentData);
  }

  void setNote(String v) => state = state.copyWith(note: v);

  Future<void> onSubmitPayNow() async {
    _commonController.showLoading(isLoading: true);
    try {
      await Future.delayed(const Duration(milliseconds: 700));
      final Map<String, dynamic> payload = {
        'data': state.paymentData?.toJson(),
        'note': state.note,
        'status': 'SUCCESS',
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _storage.add(payload);
      _commonController.showLoading(isLoading: false);
      state = state.copyWith(submitSuccess: true);
    } catch (e) {
      _commonController.showLoading(isLoading: false);
      _commonController.handleCommonError(e, onSubmitPayNow);
      state = state.copyWith(submitSuccess: false);
    }
  }
}

@freezed
class PaymentConfirmationState with _$PaymentConfirmationState {
  const factory PaymentConfirmationState({
    @Default(null) PaymentData? paymentData,
    @Default('') String note,
    @Default(false) bool submitSuccess,
  }) = _PaymentConfirmationState;
}
