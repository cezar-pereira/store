import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/app/modules/home/domain/repositories/category_repository_interface.dart';
import 'package:store/app/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_categories_usecase.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_products_from_category_usecase.dart';
import 'package:store/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import 'package:store/app/modules/home/infra/models/product_model.dart';
import 'package:store/app/modules/home/presenter/home_store.dart';

class MockCategoryRepository extends Mock
    implements CategoryRepositoryInterface {}

class MockProductRepository extends Mock implements ProductRepositoryInterface {
}

void main() {
  late HomeStore store;
  late FetchCategoriesUsecaseInterface fetchCategoriesUsecase;
  late FetchProductsUsecaseInterface fetchProductsUsecase;
  late FetchProductsFromCategoryUsecaseInterface
      fetchProductsFromCategoryUsecase;

  setUp(() {
    fetchCategoriesUsecase =
        FetchCategoriesUsecase(repository: MockCategoryRepository());
    fetchProductsUsecase =
        FetchProductsUsecase(repository: MockProductRepository());

    fetchProductsFromCategoryUsecase =
        FetchProductsFromCategoryUsecase(repository: MockProductRepository());

    store = HomeStore(
        fetchProductsFromCategoryUsecase: fetchProductsFromCategoryUsecase,
        fetchCategoriesUsecase: fetchCategoriesUsecase,
        fetchProductsUsecase: fetchProductsUsecase);
  });

  group('productIsFavorite:', () {
    test('Should return TRUE when the product is in the favorites list', () {
      final product = ProductModel.fromJson(dataMock);
      store.listFavorites.add(product);

      expect(store.productIsFavorite(product), true);
    });

    test('Should return FALSE when the product is in the favorites list', () {
      final product = ProductModel.fromJson(dataMock);
      expect(store.productIsFavorite(product), false);
    });
  });

  group('quantityProductsInCart:', () {
    test('Should return 2 when the product is not in the cart', () {
      final product = ProductModel.fromJson(dataMock);
      store.addProductInCart(product);
      store.addProductInCart(product);
      expect(store.quantityProductsInCart(product), 2);
    });

    test('Should return 0 when the product is not in the cart', () {
      final product = ProductModel.fromJson(dataMock);
      expect(store.quantityProductsInCart(product), 0);
    });
  });

  group('addRemoveProductFavorite', () {
    test(
        'Should return TRUE when adding to favorites and then return FALSE when removing',
        () {
      final product = ProductModel.fromJson(dataMock);
      store.addRemoveProductFavorite(product);
      expect(store.productIsFavorite(product), true);
      store.addRemoveProductFavorite(product);
      expect(store.productIsFavorite(product), false);
    });
  });

  group('addProductInCart:', () {
    test('cart must contain 3 product after adding', () {
      final product = ProductModel.fromJson(dataMock);
      store.addProductInCart(product);
      store.addProductInCart(product);
      store.addProductInCart(product);
      expect(store.cart.length, 3);
    });
  });

  group('removeProductFromCart:', () {
    test('cart must contain 1 product after removal', () {
      final product = ProductModel.fromJson(dataMock);
      store.addProductInCart(product);
      store.addProductInCart(product);
      store.addProductInCart(product);
      store.removeProductFromCart(product);
      store.removeProductFromCart(product);
      expect(store.cart.length, 1);
    });
  });
}

Map<String, dynamic> dataMock = {
  "id": 1,
  "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  "price": 109.95,
  "description":
      "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  "category": "men's clothing",
  "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  "rating": {"rate": 3.9, "count": 120}
};
