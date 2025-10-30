import 'package:brdz_test/core/constants/string_const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionHistoryStorage {
  TransactionHistoryStorage();

  Box<dynamic>? _box;

  Future<void>? _opening;

  static final provider = Provider((ref) => TransactionHistoryStorage());

  Future<void> _ensureOpen() {
    if (_box?.isOpen == true) return Future.value();
    _opening ??= () async {
      const name = StringConst.hiveTransactionHistoryBox;
      if (Hive.isBoxOpen(name)) {
        _box = Hive.box<dynamic>(name);
      } else {
        _box = await Hive.openBox<dynamic>(name);
      }
      if (kDebugMode) {
        debugPrint(
            'Opened Hive box: ${_box!.name}, isOpen=${_box!.isOpen}, len=${_box!.length}');
      }
    }();
    return _opening!;
  }

  /// Create
  Future<int> add(Map<String, dynamic> record) async {
    await _ensureOpen();
    return _box!.add(record);
  }

  /// Read (all) — materialize & normalize to Map<String, dynamic>
  Future<List<Map<String, dynamic>>> listAll() async {
    await _ensureOpen();
    final list = _box!.values
        .map((e) {
      if (e is Map) {
        return Map<String, dynamic>.from(e.map(
              (key, value) => MapEntry(key.toString(), value),
        ));
      }
      return <String, dynamic>{};
    })
        .where((e) => e.isNotEmpty)
        .toList(growable: false);
    return list;
  }

  /// Read by index
  Future<Map<String, dynamic>?> getAt(int index) async {
    await _ensureOpen();
    if (index < 0 || index >= _box!.length) return null;
    final v = _box!.getAt(index);
    if (v == null) return null;
    if (v is Map) {
      return Map<String, dynamic>.from(v.map(
            (key, value) => MapEntry(key.toString(), value),
      ));
    }
    return null;
  }

  /// Update by index (replace whole record)
  Future<void> putAt(int index, Map<String, dynamic> record) async {
    await _ensureOpen();
    await _box!.putAt(index, record);
  }

  /// Delete by index
  Future<void> deleteAt(int index) async {
    await _ensureOpen();
    await _box!.deleteAt(index);
  }

  /// Delete all
  Future<void> clear() async {
    await _ensureOpen();
    await _box!.clear();
  }

  /// Count
  Future<int> count() async {
    await _ensureOpen();
    return _box!.length;
  }

  /// Close box when not needed
  Future<void> close() async {
    await _box?.close();
    _box = null;
    _opening = null;
  }
}