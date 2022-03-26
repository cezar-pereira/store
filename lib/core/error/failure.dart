import 'dart:developer' as dev;

abstract class Failure {
  final String errorMessage;
  final String label;

  Failure({
    StackTrace? stackTrace,
    dynamic exception,
    this.label = '',
    this.errorMessage = '',
  }) {
    if (stackTrace != null) {
      dev.log(errorMessage,
          error: exception, stackTrace: stackTrace, name: label);
    }
  }
}

class ConnectionError extends Failure {
  ConnectionError() : super(errorMessage: 'no-connection-internet');
}

class UnknownError extends Failure {
  final dynamic exception;
  final StackTrace? stackTrace;

  UnknownError({
    String errorMessage = 'Unknown Error',
    String label = '',
    this.exception,
    this.stackTrace,
  }) : super(
            stackTrace: stackTrace,
            label: label,
            exception: exception,
            errorMessage: errorMessage);
}
