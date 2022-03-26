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

  final _$fetchCategoriesAsyncAction =
      AsyncAction('HomeStoreBase.fetchCategories');

  @override
  Future<void> fetchCategories() {
    return _$fetchCategoriesAsyncAction.run(() => super.fetchCategories());
  }

  @override
  String toString() {
    return '''
listCategories: ${listCategories}
    ''';
  }
}
