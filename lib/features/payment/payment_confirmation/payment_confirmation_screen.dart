import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/navigation/router.dart';
import 'package:brdz_test/core/utils/currency_formatter.dart';
import 'package:brdz_test/features/home/home_controller.dart';
import 'package:brdz_test/features/payment/payment_confirmation/payment_confirmation_controller.dart';
import 'package:brdz_test/shared/models/payment/payment_data.dart';
import 'package:brdz_test/shared/widgets/common/common_screen.dart';
import 'package:brdz_test/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PaymentConfirmationScreen extends ConsumerStatefulWidget {
  const PaymentConfirmationScreen({super.key, required this.data});

  final String data;

  @override
  ConsumerState<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState
    extends ConsumerState<PaymentConfirmationScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(PaymentConfirmationController.provider.notifier)
        .onScreenLoaded(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    _listenPaySuccess();

    final paymentData = ref.watch(
      PaymentConfirmationController.provider.select(
        (state) => state.paymentData,
      ),
    );
    return CommonScreen(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(context.localizations.paymentConfirmationTitle),
          centerTitle: false,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 8),
            _merchantCard(paymentData),
            _lineItems(context, paymentData),
            _noteField(context),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _btnCancel(context)),
              Expanded(child: _btnPayNow(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _merchantCard(PaymentData? paymentData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              child: Icon(Icons.store, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paymentData?.merchantName ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    paymentData?.merchantAddress ?? '',
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lineItems(BuildContext context, PaymentData? paymentData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                context.localizations.fee,
                style: const TextStyle(color: Colors.black54),
              ),
              const Spacer(),
              Text(context.localizations.free),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                context.localizations.total,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                CurrencyFormatter.indonesianRupiahFormat.format(
                  paymentData?.amount ?? 0,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _noteField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  hintText: context.localizations.noteOptional,
                ),
                // onChanged: ctrl.setNote,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnPayNow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: ElevatedButton(
        onPressed: () {
          ref.read(PaymentConfirmationController.provider.notifier).onSubmitPayNow();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: const StadiumBorder(),
        ),
        child: Text(
          context.localizations.payNow,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _btnCancel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: ElevatedButton(
        onPressed: () {
          context.pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.black, width: 1),
        ),
        child: Text(
          context.localizations.cancel,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _listenPaySuccess() {
    ref.listen(
      PaymentConfirmationController.provider.select(
        (state) => state.submitSuccess,
      ),
      (prev, next) {
        if (next) {
          showCustomSnackBar(
            context,
            CustomSnackBar(
              message: context.localizations.paymentSuccess,
              type: CustomSnackBarType.positive,
            ),
          );
          ref.read(HomeController.provider.notifier).load();
          context.goNamed(AppRouter.homeRoute);
        }
      },
    );
  }
}
