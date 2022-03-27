import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home/domain/entities/product_entity.dart';
import 'components/body.dart';

class DetailsProductPage extends StatelessWidget {
  const DetailsProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Text(
            product.title,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
        ),
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
