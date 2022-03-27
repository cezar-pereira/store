import 'package:flutter/material.dart';

import 'package:store/app/modules/home/domain/entities/product_entity.dart';
import 'package:store/core/theme/theme.dart';

import 'indicator_images.dart';
import 'row_colors.dart';
import 'row_sizes.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          height: 300,
          alignment: Alignment.center,
          child: PageView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 300,
                      child:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                    SizedBox(
                      height: 300,
                      width: 200,
                      child: Hero(
                          tag: product.image,
                          child: Image.network(product.image,
                              fit: BoxFit.scaleDown)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        height: 300,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const IndicatorImages(quantifyImages: 3, imageSelected: 0),
        const SizedBox(height: 30),
        const RowSizes(),
        const SizedBox(height: 20),
        Visibility(
          visible: product.category.name.contains('clothing'),
          child: const RowColors(),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Description:', style: title2),
              const SizedBox(width: 4),
              Flexible(
                  child: Text(
                product.description,
                style: title,
                textAlign: TextAlign.justify,
              )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price:', style: title2),
              Text('\$ ${product.price}', style: title),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.red),
              ],
              color: Colors.red,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)),
            ),
            child: const Center(
              child: Text(
                'Add to basket',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
