import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/utils/currency_formatter.dart';
import 'package:brdz_test/core/utils/date_utils.dart';
import 'package:brdz_test/features/home/home_controller.dart';
import 'package:brdz_test/shared/models/payment/transaction_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<void> _onRefresh() async {
    await ref.read(HomeController.provider.notifier).refresh();
  }

  Widget _buildItem(TransactionHistoryModel data) {
    final date = DateTime.parse(data.timestamp!);

    final statusColor = data.status == 'SUCCESS'
        ? Colors.green.shade700
        : (data.status == 'failed' ? Colors.red.shade700 : Colors.black54);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            child: const Icon(
              Icons.receipt_long_rounded,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Merchant + Amount
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.data?.merchantName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.indonesianRupiahFormat.format(
                        data.data?.amount,
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      date.formatToString('ID', dMMMyyyySpaceWithTimePattern),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: statusColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        data.status ?? '',
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                if (data.note!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    data.note ?? '',
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: () {
              _showDetail(data);
            },
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  void _showDetail(TransactionHistoryModel data) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _kv(context.localizations.status, data.status),
                _kv(context.localizations.transactionDate, data.timestamp),
                _kv(context.localizations.note, data.note),
                const Divider(height: 24),
                Text(
                  context.localizations.merchant,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                _kv(context.localizations.merchant, data.data?.merchantName),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _kv(String k, dynamic v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              k,
              style: const TextStyle(color: Colors.black54),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              v?.toString() ?? '-',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.receipt_long_outlined,
            size: 48,
            color: Colors.black26,
          ),
          const SizedBox(height: 8),
          Text(
            context.localizations.noPaymentHistory,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            context.localizations.pullToRefresh,
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _onRefresh,
            icon: const Icon(Icons.refresh),
            label: Text(context.localizations.refresh),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(
      HomeController.provider.select((state) => state.items),
    );

    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.transactionHistory)),
      backgroundColor: Colors.grey.shade50,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: Colors.black,
        child: list.isNotEmpty ?  ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (_, i) {
            return _buildItem(list[i]);
          },
        ) : _emptyState(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(HomeController.provider.notifier).load();
    });
  }
}
