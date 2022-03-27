import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/app/modules/home/domain/erros/failures.dart';
import 'package:store/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_products_from_category_usecase.dart';
import 'package:store/app/modules/home/infra/models/category_model.dart';
import 'package:store/core/error/failure.dart';

class MockProductRepository extends Mock implements ProductRepositoryInterface {
}

void main() {
  late FetchProductsFromCategoryUsecaseInterface usecase;
  late ProductRepositoryInterface repository;
  const category = CategoryModel(name: 'eletronics');

  setUp(() {
    repository = MockProductRepository();
    usecase = FetchProductsFromCategoryUsecase(repository: repository);
  });

  test(
      'should return a List<ProductEntity> when call fetchProductsFromCategory',
      () async {
    List<ProductEntity> list = [];

    when(() => repository.fetchProductsFromCategory(category: category))
        .thenAnswer((_) async => Right<Failure, List<ProductEntity>>(list));
    final result = await usecase(category);
    expect(result, Right(list));
    verify(() => repository.fetchProductsFromCategory(category: category))
        .called(1);
  });

  test('should return a Failure when call usecase', () async {
    final error = FetchProductsFromCategoryException.empty();
    when(() => repository.fetchProductsFromCategory(category: category))
        .thenAnswer((_) async => Left(error));
    final result = await usecase(category);
    expect(result, Left(error));
    verify(() => repository.fetchProductsFromCategory(category: category))
        .called(1);
  });
}
