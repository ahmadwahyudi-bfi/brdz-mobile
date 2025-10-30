import 'package:brdz_test/core/config/network/exceptions.dart';
import 'package:brdz_test/shared/models/error/error_exception.dart';
import 'package:brdz_test/shared/models/error/error_response.dart';

Future<T> catchWithException<T>(
    Future<T> Function() apiCall,
    ) async {
  try {
    return await apiCall();
  } on HttpStatusCodeException catch (e) {
    final error = ErrorResponse.fromJson(e.data as Map<String, dynamic>);
    throw ErrorException(
      code: e.statusCode,
      message: error.message ?? 'unknown',
      success: error.success ?? false,
      timeStamp: error.timestamp ?? DateTime.now().toIso8601String(),
    );
  }
}
