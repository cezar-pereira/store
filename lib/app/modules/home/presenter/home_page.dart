import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/home/presenter/components/card_product_component.dart';
import 'package:store/core/components/app_divider.dart';
import 'package:store/core/theme/app_icons.dart';

import 'components/list_categories_component.dart';
import 'home_store.dart';
import 'states.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Zummedy"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    controller.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: AppIcon(icon: AppIcons.settings),
          )
        ],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              return controller.listCategories.isNotEmpty
                  ? _listCategories()
                  : Container();
            },
          ),
          Observer(
            builder: (_) {
              final state = controller.productHomeState;
              if (state is FetchStateLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              } else if (state is FetchStateError) {
                return Center(child: Text(state.failure.errorMessage));
              } else {
                state as FetchStateSucess;
                return Expanded(
                  child: GridView.builder(
                      itemCount: state.data.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return CardProductComponent(product: state.data[index]);
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _listCategories() {
    return Column(
      children: [
        const AppDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListCategoriesComponent(
            list: controller.listCategories,
            onTap: () {},
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}
