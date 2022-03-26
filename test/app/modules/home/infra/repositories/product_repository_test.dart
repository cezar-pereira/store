import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/infra/datasource/product_datasource_interface.dart';
import 'package:store/app/modules/home/infra/models/product_model.dart';
import 'package:store/app/modules/home/infra/repositories/product_repository.dart';

class MockProductDatasource extends Mock implements ProductDatasourceInterface {
}

void main() {
  late ProductRepository repository;
  late ProductDatasourceInterface datasource;

  setUp(() {
    datasource = MockProductDatasource();
    repository = ProductRepository(datasource: datasource);
  });
  test('should return a List<ProductModel> when call fetchCAtegories',
      () async {
    List<ProductModel> list = [];
    when(() => datasource.fetchProducts()).thenAnswer((_) async => list);

    final result = await repository.fetchProducts();

    expect(result, Right(list));

    verify(() => datasource.fetchProducts()).called(1);
  });
}
