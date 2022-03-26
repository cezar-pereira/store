import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/domain/entities/category_entity.dart';
import 'package:store/app/modules/home/domain/erros/failures.dart';
import 'package:store/app/modules/home/domain/repositories/category_repository_interface.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_categories_usecase.dart';

class MockCategoryRepository extends Mock
    implements CategoryRepositoryInterface {}

void main() {
  late FetchCategoriesUsecase usecase;
  late CategoryRepositoryInterface repository;

  setUp(() {
    repository = MockCategoryRepository();
    usecase = FetchCategoriesUsecase(repository: repository);
  });

  test('Should return a list of CategoryModel when call fetchCategories',
      () async {
    List<CategoryEntity> list = [];
    when(() => repository()).thenAnswer((_) async => Right(list));
    final result = await usecase();
    expect(result, Right(list));
    verify(() => repository()).called(1);
  });

  test('Should return Failure', () async {
    final failure = FetchCategoriesException.empty();
    when(() => repository()).thenAnswer((_) async => Left(failure));
    final result = await usecase();
    expect(result, Left(failure));
    verify(() => repository()).called(1);
  });
}
