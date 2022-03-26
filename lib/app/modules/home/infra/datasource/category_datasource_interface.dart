import 'package:store/app/modules/home/infra/models/category_model.dart';

abstract class CategoryDatasourceInterface {
  Future<List<CategoryModel>> fetchCategories();
}
