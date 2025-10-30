import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/core/navigation/router.dart';
import 'package:brdz_test/features/payment/qr_scanner/qr_scanner_screen.dart';
import 'package:brdz_test/shared/widgets/center_floating_button.dart';
import 'package:brdz_test/shared/widgets/custom_bottom_nav.dart';
import 'package:brdz_test/shared/widgets/custom_snack_bar.dart';
import 'package:brdz_test/shared/widgets/lazy_index_stacked.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum TopLevelTab {
  home(
    route: AppRouter.homeRoute,
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  payment(route: AppRouter.paymentRoute, icon: null, selectedIcon: null),
  wallet(
    route: AppRouter.walletRoute,
    icon: Icons.account_balance_wallet_outlined,
    selectedIcon: Icons.account_balance_wallet,
  );

  const TopLevelTab({
    required this.route,
    required this.icon,
    required this.selectedIcon,
  });

  final String route;
  final IconData? icon;
  final IconData? selectedIcon;

  UiText get label {
    switch (this) {
      case TopLevelTab.home:
        return UiText.localized((localizations) => localizations.home);
      case TopLevelTab.payment:
        return UiText.localized((localizations) => localizations.empty);
      case TopLevelTab.wallet:
        return UiText.localized((localizations) => localizations.wallet);
    }
  }
}

class TopLevelScreen extends StatelessWidget {
  const TopLevelScreen({
    super.key,
    required this.tab,
    required this.onTabChanged,
    required this.children,
  });

  final TopLevelTab tab;

  final Function(TopLevelTab tab) onTabChanged;

  final List<Widget> children;

  int get currentIndex => TopLevelTab.values.indexWhere((tab) {
    return tab == this.tab;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LazyIndexedStack(
        index: TopLevelTab.values.indexWhere((tab) => tab == this.tab),
        children: children,
      ),
      floatingActionButton: CenterFloatingButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const QrScannerScreen()),
          );
          if (result != null && result.toString().contains('AES-GCM')) {
            context.pushNamed(AppRouter.paymentConfirmationRoute, extra: result);
          } else {
            showCustomSnackBar(
              context,
              CustomSnackBar(
                message: context.localizations.qrNotValid,
                type: CustomSnackBarType.negative,
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: BottomAppBar(
          color: Colors.white,
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...TopLevelTab.values.mapIndexed((index, tab) {
                  return InkWell(
                    child: CustomBottomNavItem(
                      icon: Icon(
                        tab.index == currentIndex ? tab.selectedIcon : tab.icon,
                      ),
                      label: Text(
                        context.getString(tab.label),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    onTap: () {
                      onTabChanged(TopLevelTab.values[index]);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
