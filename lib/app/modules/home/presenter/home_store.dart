import 'package:mobx/mobx.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import '../domain/entities/category_entity.dart';
import '../domain/entities/product_entity.dart';
import '../domain/usecases/fetch_categories_usecase.dart';
import 'states.dart';
import 'package:collection/collection.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final FetchCategoriesUsecaseInterface _fetchCategoriesUsecase;
  final FetchProductsUsecaseInterface _fetchProductsUsecase;

  HomeStoreBase({
    required FetchCategoriesUsecaseInterface fetchCategoriesUsecase,
    required FetchProductsUsecaseInterface fetchProductsUsecase,
  })  : _fetchCategoriesUsecase = fetchCategoriesUsecase,
        _fetchProductsUsecase = fetchProductsUsecase;

  @observable
  List<CategoryEntity> listCategories = [];

  @observable
  ProductHomeState productHomeState = FetchStateLoading();

  @observable
  var listFavorites = ObservableList<ProductEntity>();

  @observable
  List<ProductEntity> cart = [];

  @action
  Future<void> fetchCategories() async {
    final result = await _fetchCategoriesUsecase();
    result.fold((l) {}, (r) => listCategories = r);
  }

  @action
  Future<void> fetchProducts() async {
    final result = await _fetchProductsUsecase();
    result.fold((l) {
      productHomeState = FetchStateError(failure: l);
    }, (r) {
      productHomeState = FetchStateSucess(data: r);
    });
  }

  @action
  Future<void> load() async {
    Future.wait([fetchCategories(), fetchProducts()]);
  }

  bool productIsFavorite(ProductEntity product) {
    final result =
        listFavorites.firstWhereOrNull((element) => element == product);
    return result == null ? false : true;
  }

  int quantityProductsInCart(ProductEntity product) {
    int count = 0;

    for (var element in cart) {
      if (element == product) count++;
    }

    return count;
  }

  addRemoveProductFavorite(ProductEntity product) {
    productIsFavorite(product)
        ? listFavorites.remove(product)
        : listFavorites.add(product);
  }

  addProductInCart(ProductEntity product) {
    cart.add(product);
  }

  removeProductFromCart(ProductEntity product) {
    cart.remove(product);
  }
}
