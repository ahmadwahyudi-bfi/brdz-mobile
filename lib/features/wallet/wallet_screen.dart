import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/navigation/router.dart';
import 'package:brdz_test/services/api/auth/auth_repository.dart';
import 'package:brdz_test/shared/widgets/common/common_screen.dart';
import 'package:brdz_test/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  // Hardcoded values
  final String _walletAddress = '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb';
  final String _balance = '1.2547';
  final String _networkName = 'WalletConnect';

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(context.localizations.walletTitle),
          centerTitle: false,
        ),
        backgroundColor: Colors.grey.shade50,
        body: _buildConnectedView(context),
      ),
    );
  }

  Widget _buildConnectedView(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _walletCard(context),
          const SizedBox(height: 24),
          Text(
            context.localizations.actions,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _actionCard(
            context,
            icon: Icons.logout,
            title: context.localizations.logout,
            subtitle: context.localizations.logoutDesc,
            onTap: () {
              ref.read(AuthRepository.provider).clearSession();
              context.goNamed(AppRouter.loginRoute);
            },
          ),
        ],
      ),
    );
  }

  Widget _walletCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo.shade600,
            Colors.indigo.shade800,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _networkName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            context.localizations.balance,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$_balance ETH',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            context.localizations.walletAddress,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: _walletAddress));
              showCustomSnackBar(
                context,
                CustomSnackBar(
                  message: context.localizations.addressCopied,
                  type: CustomSnackBarType.positive,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _walletAddress,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.copy,
                    color: Colors.white70,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.indigo.shade600,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black26),
          ],
        ),
      ),
    );
  }

  void _showConnectOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
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
              children: [
                Text(
                  context.localizations.selectWalletProvider,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                _providerOption(
                  context,
                  icon: Icons.account_balance_wallet,
                  title: 'MetaMask',
                  onTap: () {
                    Navigator.pop(context);
                    showCustomSnackBar(
                      context,
                      CustomSnackBar(
                        message: 'MetaMask connected',
                        type: CustomSnackBarType.positive,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                _providerOption(
                  context,
                  icon: Icons.link,
                  title: 'WalletConnect',
                  onTap: () {
                    Navigator.pop(context);
                    showCustomSnackBar(
                      context,
                      CustomSnackBar(
                        message: 'WalletConnect connected',
                        type: CustomSnackBarType.positive,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _providerOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  void _showSendTransactionDialog(BuildContext context) {
    final recipientController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.localizations.sendTransaction),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: recipientController,
              decoration: InputDecoration(
                labelText: context.localizations.recipientAddress,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: context.localizations.amount,
                border: const OutlineInputBorder(),
                suffixText: 'ETH',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showCustomSnackBar(
                context,
                CustomSnackBar(
                  message: '${context.localizations.transactionSent}: 0x1234...abcd',
                  type: CustomSnackBarType.positive,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text(
              context.localizations.send,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showSignMessageDialog(BuildContext context) {
    final messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.localizations.signMessage),
        content: TextField(
          controller: messageController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: context.localizations.message,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.localizations.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showCustomSnackBar(
                context,
                CustomSnackBar(
                  message: 'Message signed: 0xabcd...1234',
                  type: CustomSnackBarType.positive,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text(
              context.localizations.sign,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
