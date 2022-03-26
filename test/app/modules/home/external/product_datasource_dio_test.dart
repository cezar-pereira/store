import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/infra/datasource/product_datasource_interface.dart';
import 'package:store/app/modules/home/infra/models/product_model.dart';

class ProductDatasourceMock extends Mock implements ProductDatasourceInterface {
}

void main() {
  late ProductDatasourceInterface datasource;

  setUp(() {
    datasource = ProductDatasourceMock();
  });

  test(
      'should return a List<ProductModel> when call fetchCategories datasource',
      () async {
    List<ProductModel> list = [];
    when(() => datasource.fetchProducts()).thenAnswer((_) async => list);
    final result = await datasource.fetchProducts();
    expect(result, isA<List<ProductModel>>());
  });
}
