import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/app/modules/home/domain/erros/failures.dart';
import 'package:store/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import 'package:store/core/error/failure.dart';

class MockProductRepository extends Mock implements ProductRepositoryInterface {
}

void main() {
  late FetchProductsUsecaseInterface usecase;
  late ProductRepositoryInterface repository;

  setUp(() {
    repository = MockProductRepository();
    usecase = FetchProductsUsecase(repository: repository);
  });

  test('should return a List<ProductEntity> when call fetchProducts', () async {
    List<ProductEntity> list = [];
    when(() => repository.fetchProducts())
        .thenAnswer((_) async => Right<Failure, List<ProductEntity>>(list));

    final result = await usecase();

    expect(result, Right(list));

    verify(() => repository.fetchProducts()).called(1);
  });

  test('should return a Failure when call usecase', () async {
    final error = FetchProductException.empty();
    when(() => repository.fetchProducts()).thenAnswer((_) async => Left(error));

    final result = await usecase();

    expect(result, Left(error));

    verify(() => repository.fetchProducts()).called(1);
  });
}
