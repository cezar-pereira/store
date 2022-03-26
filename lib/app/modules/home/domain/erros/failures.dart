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
