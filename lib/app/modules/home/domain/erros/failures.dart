import 'package:store/core/error/failure.dart';

class FetchCategoriesException extends Failure {
  FetchCategoriesException.empty();
  FetchCategoriesException(
    StackTrace stackTrace,
    String label,
    dynamic exception,
    String errorMessage,
  ) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}

class FetchProductException extends Failure {
  FetchProductException.empty();
  FetchProductException(
    StackTrace stackTrace,
    String label,
    dynamic exception,
    String errorMessage,
  ) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
