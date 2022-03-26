import 'package:mobx/mobx.dart';
import '../domain/entities/category_entity.dart';
import '../domain/usecases/fetch_categories_usecase.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final FetchCategoriesUsecase _fetchCategoriesUsecase;

  HomeStoreBase({required FetchCategoriesUsecase fetchCategoriesUsecase})
      : _fetchCategoriesUsecase = fetchCategoriesUsecase;

  @observable
  List<CategoryEntity> listCategories = [];

  @action
  Future<void> fetchCategories() async {
    final result = await _fetchCategoriesUsecase();
    result.fold((l) {}, (r) => listCategories = r);
  }
}
