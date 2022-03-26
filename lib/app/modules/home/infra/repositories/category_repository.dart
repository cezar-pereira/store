import 'package:dartz/dartz.dart';
import 'package:store/app/modules/home/domain/entities/category_entity.dart';
import 'package:store/app/modules/home/domain/repositories/category_repository_interface.dart';
import 'package:store/core/error/failure.dart';

import '../datasource/category_datasource_interface.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final CategoryDatasourceInterface _datasource;
  CategoryRepository({required CategoryDatasourceInterface datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    try {
      final result = await _datasource.fetchCategories();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
