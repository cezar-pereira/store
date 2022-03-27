import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/home/presenter/home_store.dart';

import '../../../../../core/theme/theme.dart';

class CartCountComponent extends StatefulWidget {
  const CartCountComponent({Key? key}) : super(key: key);

  @override
  _CartCountComponentState createState() => _CartCountComponentState();
}

class _CartCountComponentState
    extends ModularState<CartCountComponent, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Stack(
          children: [
            const SizedBox(
              height: 30,
              width: 38,
              child: AppIcon(icon: AppIcons.cart, size: 25),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Visibility(
                visible: store.cart.isNotEmpty,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: AppColors.neutral,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(store.cart.length.toString().padLeft(2, '0'),
                      style: caption2),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
