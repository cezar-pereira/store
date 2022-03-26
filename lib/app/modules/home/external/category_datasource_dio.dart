import 'package:dio/dio.dart';
import 'package:store/app/modules/home/infra/models/category_model.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/core/helpers/environments.dart';
import 'package:store/core/provider/http/http_provider_dio.dart';

import '../domain/erros/failures.dart';
import '../infra/datasource/category_datasource_interface.dart';

class CategoryDatasource extends HttpProviderDio
    implements CategoryDatasourceInterface {
  CategoryDatasource() : super(baseUrl: Environments.getUrlBase(preffix: ''));

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final result = await http.get('products/categories');
      return [
        const CategoryModel(name: 'New arrivals'),
        ...result.data
            .map<CategoryModel>((json) => CategoryModel(name: json))
            .toList()
      ];
    } on DioError catch (exception, stackTrace) {
      if (exception.type == DioErrorType.response) {
        throw FetchCategoriesException(
            stackTrace,
            'CategoryDatasource-fetchCategories',
            exception,
            exception.response!.data['status_message']);
      } else {
        throw ConnectionError();
      }
    } on Exception catch (exception, stackTrace) {
      throw FetchCategoriesException(
          stackTrace,
          'CategoryDatasource-fetchCategories',
          exception,
          exception.toString());
    }
  }
}
