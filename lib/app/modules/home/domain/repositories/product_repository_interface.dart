import 'package:dartz/dartz.dart';

import 'package:store/app/modules/home/domain/entities/category_entity.dart';
import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/core/error/failure.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();
  Future<Either<Failure, List<ProductEntity>>> fetchProductsFromCategory(
      {required CategoryEntity category});
}
