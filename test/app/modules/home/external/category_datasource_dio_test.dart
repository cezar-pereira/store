import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/infra/datasource/category_datasource_interface.dart';
import 'package:store/app/modules/home/infra/models/category_model.dart';

class CategoryDatasourceMock extends Mock
    implements CategoryDatasourceInterface {}

void main() {
  late CategoryDatasourceInterface datasource;

  setUp(() {
    datasource = CategoryDatasourceMock();
  });

  test(
      'should return a List<CategoryModel> when call fetchCategories datasource',
      () async {
    List<CategoryModel> list = [];
    when(() => datasource.fetchCategories()).thenAnswer((_) async => list);
    final result = await datasource.fetchCategories();
    expect(result, isA<List<CategoryModel>>());
  });
}
