import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/details_product_page.dart';

class ProductDetailsModuleModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => DetailsProductPage(product: args.data)),
  ];
}
