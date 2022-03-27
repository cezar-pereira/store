import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/core/theme/theme.dart';

import '../home_store.dart';

class ButtonAddProduct extends StatefulWidget {
  const ButtonAddProduct({Key? key, required this.product}) : super(key: key);

  final ProductEntity product;

  @override
  State<ButtonAddProduct> createState() => _ButtonAddProductState();
}

class _ButtonAddProductState extends State<ButtonAddProduct> {
  final HomeStore store = Modular.get<HomeStore>();

  final double _widthButton = 35;
  @override
  Widget build(BuildContext context) {
    int count = store.quantityProductsInCart(widget.product);
    return count == 0 ? notInCart() : inCart(count);
  }

  Widget notInCart() {
    return GestureDetector(
      onTap: () {
        setState(() {
          store.addProductInCart(widget.product);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: _widthButton,
        decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget inCart(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: _widthButton,
      decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                store.removeProductFromCart(widget.product);
              });
            },
            child: const Icon(Icons.remove, color: Colors.white),
          ),
          Text(count.toString().padLeft(2, '0'), style: subTitle),
          GestureDetector(
            onTap: () {
              setState(() {
                store.addProductInCart(widget.product);
              });
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
