import 'package:dio/dio.dart';
import 'package:store/app/modules/home/domain/entities/category_entity.dart';
import 'package:store/app/modules/home/infra/datasource/product_datasource_interface.dart';
import 'package:store/app/modules/home/infra/models/product_model.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/core/helpers/environments.dart';
import 'package:store/core/provider/http/http_provider_dio.dart';

import '../domain/erros/failures.dart';

class ProductDatasource extends HttpProviderDio
    implements ProductDatasourceInterface {
  ProductDatasource() : super(baseUrl: Environments.getUrlBase(preffix: ''));

  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final result = await http.get('products');
      return result.data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } on DioError catch (exception, stackTrace) {
      if (exception.type == DioErrorType.response) {
        throw FetchProductException(
            stackTrace,
            'ProductDatasource-fetchProducts',
            exception,
            exception.response!.statusMessage.toString());
      } else {
        throw ConnectionError();
      }
    } on Exception catch (exception, stackTrace) {
      throw FetchProductException(stackTrace, 'ProductDatasource-fetchProducts',
          exception, exception.toString());
    }
  }

  @override
  Future<List<ProductModel>> fetchProductsFromCategory(
      {required CategoryEntity category}) {
    // TODO: implement fetchProductsFromCategory
    throw UnimplementedError();
  }
}
