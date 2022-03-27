import 'package:store/core/error/failure.dart';

import '../domain/entities/product_entity.dart';

abstract class ProductHomeState {}

class FetchStateLoading implements ProductHomeState {}

class FetchStateSucess implements ProductHomeState {
  final List<ProductEntity> data;
  FetchStateSucess({required this.data});
}

class FetchStateError implements ProductHomeState {
  final Failure failure;
  FetchStateError({required this.failure});
}
