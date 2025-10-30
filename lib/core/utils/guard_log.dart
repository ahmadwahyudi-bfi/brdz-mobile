import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<AsyncValue<T>> guardLog<T>(Future<T> Function() future) async {
  final result = await AsyncValue.guard(future);
  if (result.hasError) {
    // todo log the error in crashlytics, datadog etc
    print('error: $result');
  }
  return result;
}
