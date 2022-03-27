// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$listCategoriesAtom = Atom(name: 'HomeStoreBase.listCategories');

  @override
  List<CategoryEntity> get listCategories {
    _$listCategoriesAtom.reportRead();
    return super.listCategories;
  }

  @override
  set listCategories(List<CategoryEntity> value) {
    _$listCategoriesAtom.reportWrite(value, super.listCategories, () {
      super.listCategories = value;
    });
  }

  final _$productHomeStateAtom = Atom(name: 'HomeStoreBase.productHomeState');

  @override
  ProductHomeState get productHomeState {
    _$productHomeStateAtom.reportRead();
    return super.productHomeState;
  }

  @override
  set productHomeState(ProductHomeState value) {
    _$productHomeStateAtom.reportWrite(value, super.productHomeState, () {
      super.productHomeState = value;
    });
  }

  final _$listFavoritesAtom = Atom(name: 'HomeStoreBase.listFavorites');

  @override
  ObservableList<ProductEntity> get listFavorites {
    _$listFavoritesAtom.reportRead();
    return super.listFavorites;
  }

  @override
  set listFavorites(ObservableList<ProductEntity> value) {
    _$listFavoritesAtom.reportWrite(value, super.listFavorites, () {
      super.listFavorites = value;
    });
  }

  final _$cartAtom = Atom(name: 'HomeStoreBase.cart');

  @override
  List<ProductEntity> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<ProductEntity> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  final _$categorySelectedAtom = Atom(name: 'HomeStoreBase.categorySelected');

  @override
  CategoryEntity? get categorySelected {
    _$categorySelectedAtom.reportRead();
    return super.categorySelected;
  }

  @override
  set categorySelected(CategoryEntity? value) {
    _$categorySelectedAtom.reportWrite(value, super.categorySelected, () {
      super.categorySelected = value;
    });
  }

  final _$fetchCategoriesAsyncAction =
      AsyncAction('HomeStoreBase.fetchCategories');

  @override
  Future<void> fetchCategories() {
    return _$fetchCategoriesAsyncAction.run(() => super.fetchCategories());
  }

  final _$fetchProductsFromCategoryAsyncAction =
      AsyncAction('HomeStoreBase.fetchProductsFromCategory');

  @override
  Future<void> fetchProductsFromCategory() {
    return _$fetchProductsFromCategoryAsyncAction
        .run(() => super.fetchProductsFromCategory());
  }

  final _$fetchProductsAsyncAction = AsyncAction('HomeStoreBase.fetchProducts');

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  final _$loadAsyncAction = AsyncAction('HomeStoreBase.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  @override
  String toString() {
    return '''
listCategories: ${listCategories},
productHomeState: ${productHomeState},
listFavorites: ${listFavorites},
cart: ${cart},
categorySelected: ${categorySelected}
    ''';
  }
}
