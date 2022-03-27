import 'package:dartz/dartz.dart';
import 'package:store/core/error/failure.dart';

import '../entities/category_entity.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository_interface.dart';

abstract class FetchProductsFromCategoryUsecaseInterface {
  Future<Either<Failure, List<ProductEntity>>> call(CategoryEntity category);
}

class FetchProductsFromCategoryUsecase
    implements FetchProductsFromCategoryUsecaseInterface {
  final ProductRepositoryInterface repository;

  FetchProductsFromCategoryUsecase({required this.repository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      CategoryEntity category) async {
    return repository.fetchProductsFromCategory(category: category);
  }
}
