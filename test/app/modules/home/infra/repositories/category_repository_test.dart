import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/infra/datasource/category_datasource_interface.dart';
import 'package:store/app/modules/home/infra/models/category_model.dart';
import 'package:store/app/modules/home/infra/repositories/category_repository.dart';

class MockCategoryDatasource extends Mock
    implements CategoryDatasourceInterface {}

void main() {
  late CategoryRepository repository;
  late CategoryDatasourceInterface datasource;

  setUp(() {
    datasource = MockCategoryDatasource();
    repository = CategoryRepository(datasource: datasource);
  });
  test('should return a List<CategoryModel> when call fetchCAtegories',
      () async {
    List<CategoryModel> list = [];
    when(() => datasource.fetchCategories()).thenAnswer((_) async => list);

    final result = await repository();

    expect(result, Right(list));

    verify(() => datasource.fetchCategories()).called(1);
  });
}
