class Failure implements Exception {
  final String? message;
  final Exception? exception;
  final StackTrace _stackTrace;

  Failure({
    this.message,
    this.exception,
    StackTrace? stackTrace,
  }) : _stackTrace = stackTrace ?? StackTrace.current;

  @override
  String toString() => '''| --- Failure --- |
  message: $message
  exception: $exception
  stackTrace: $_stackTrace
  ''';

  Failure copyWith({
    final String? message,
    final Exception? exception,
    final StackTrace? stackTrace,
  }) {
    return Failure(
      message: message ?? this.message,
      stackTrace: stackTrace ?? _stackTrace,
      exception: exception ?? this.exception,
    );
  }
}
