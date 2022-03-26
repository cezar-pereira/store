import 'package:dartz/dartz.dart';

import 'package:store/core/error/failure.dart';

import '../entities/category_entity.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, List<CategoryEntity>>> call();
}
