import 'package:dartz/dartz.dart';
import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/app/modules/home/domain/entities/category_entity.dart';
import 'package:store/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:store/app/modules/home/infra/datasource/product_datasource_interface.dart';
import 'package:store/core/error/failure.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface _datasource;

  ProductRepository({required ProductDatasourceInterface datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    try {
      final result = await _datasource.fetchProducts();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProductsFromCategory(
      {required CategoryEntity category}) async {
    try {
      final result =
          await _datasource.fetchProductsFromCategory(category: category);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
