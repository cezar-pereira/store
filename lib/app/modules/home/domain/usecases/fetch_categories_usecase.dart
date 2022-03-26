import 'package:dartz/dartz.dart';
import 'package:store/core/error/failure.dart';

import '../entities/category_entity.dart';
import '../repositories/category_repository_interface.dart';

abstract class FetchCategoriesUsecaseInterface {
  Future<Either<Failure, List<CategoryEntity>>> call();
}

class FetchCategoriesUsecase implements FetchCategoriesUsecaseInterface {
  final CategoryRepositoryInterface repository;

  FetchCategoriesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return repository();
  }
}
