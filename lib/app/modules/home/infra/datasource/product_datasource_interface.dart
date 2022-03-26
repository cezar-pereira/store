import 'package:store/app/modules/home/domain/entities/category_entity.dart';

import '../models/product_model.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductModel>> fetchProducts();
  Future<List<ProductModel>> fetchProductsFromCategory(
      {required CategoryEntity category});
}
