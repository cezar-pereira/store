import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/core/theme/theme.dart';

import '../../domain/entities/product_entity.dart';
import '../home_store.dart';
import 'button_add_product.dart';

class CardProductComponent extends StatefulWidget {
  const CardProductComponent({Key? key, required this.product})
      : super(key: key);

  final ProductEntity product;

  @override
  State<CardProductComponent> createState() => _CardProductComponentState();
}

class _CardProductComponentState extends State<CardProductComponent> {
  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
            left: BorderSide(color: AppColors.secundary, width: 1),
            bottom: BorderSide(color: AppColors.secundary, width: 1),
          )),
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.product.image),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    ),
                  ),
                  _alertPercent(),
                  _favorite()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                child: Text("\$ ${widget.product.price}", style: title),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.small),
                  child: Text(
                    widget.product.title,
                    overflow: TextOverflow.ellipsis,
                    style: subTitle,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: ButtonAddProduct(product: widget.product)),
      ],
    );
  }

  Widget _alertPercent() {
    return Container(
      height: 30,
      width: 50,
      decoration: const BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
      child: const Center(child: Text('15%')),
    );
  }

  Widget _favorite() {
    return Positioned(
      right: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            store.addRemoveProductFavorite(widget.product);
          });
        },
        child: Container(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: store.productIsFavorite(widget.product)
              ? const Icon(AppIcons.favoriteAdded)
              : const Icon(AppIcons.favorite),
        ),
      ),
    );
  }
}
