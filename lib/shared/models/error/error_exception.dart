class ErrorException implements Exception {
  ErrorException({
    required this.code,
    required this.success,
    required this.timeStamp,
    required this.message,
  });

  final int code;
  final bool success;
  final String message;
  final String timeStamp;
}
