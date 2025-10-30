import 'package:brdz_test/services/storage/transaction_history_storage.dart';
import 'package:brdz_test/shared/models/payment/transaction_history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_controller.freezed.dart';

class HomeController extends StateNotifier<HomeUiState> {
  HomeController(this._storage) : super(const HomeUiState());

  static final provider =
      StateNotifierProvider.autoDispose<HomeController, HomeUiState>((ref) {
        return HomeController(ref.watch(TransactionHistoryStorage.provider));
      });

  final TransactionHistoryStorage _storage;

  Future<void> load() async {
    // if (state.loading) return;
    // state = state.copyWith(loading: true, error: null);

    try {
      final list = await _storage.listAll();
      print('list: ${list.length}');
      list.sort((a, b) {
        final ta =
            DateTime.tryParse(a['timestamp']?.toString() ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0);
        final tb =
            DateTime.tryParse(b['timestamp']?.toString() ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0);
        return tb.compareTo(ta);
      });
      state = state.copyWith(
        items: list.map((e) => TransactionHistoryModel.fromJson(e)).toList(),
        loading: false,
        error: null,
        lastRefreshed: DateTime.now(),
      );
    } catch (e) {
      print('error: $e');
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    if (state.loading) return;
    state = state.copyWith(loading: true, error: null);
    await load();
  }

  Future<void> deleteAt(int index) async {
    try {
      await _storage.deleteAt(index);
      await load();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> clearAll() async {
    try {
      await _storage.clear();
      await load();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

@freezed
class HomeUiState with _$HomeUiState {
  const factory HomeUiState({
    @Default([]) List<TransactionHistoryModel> items,
    @Default(false) bool loading,
    String? error,
    DateTime? lastRefreshed,
  }) = _HomeUiState;
}
