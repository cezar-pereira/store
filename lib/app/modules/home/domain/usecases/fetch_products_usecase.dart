import 'package:dartz/dartz.dart';
import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/core/error/failure.dart';

import '../repositories/product_repository_interface.dart';

abstract class FetchProductsUsecaseInterface {
  Future<Either<Failure, List<ProductEntity>>> call();
}

class FetchProductsUsecase implements FetchProductsUsecaseInterface {
  ProductRepositoryInterface repository;
  FetchProductsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return repository.fetchProducts();
  }
}
