import 'package:store/app/modules/home/domain/entities/product_entity.dart';

import 'category_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required int id,
    required String title,
    required String description,
    required CategoryModel category,
    required double price,
    required String image,
  }) : super(
            id: id,
            title: title,
            description: description,
            category: category,
            price: price,
            image: image);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: CategoryModel(name: json['category']),
        price: json['price'].toDouble(),
        image: json['image']);
  }
}
