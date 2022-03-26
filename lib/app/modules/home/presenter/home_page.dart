import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/core/components/app_divider.dart';
import 'package:store/core/theme/app_icons.dart';

import 'components/list_categories_component.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Zummedy"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    controller.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.replay_outlined),
          onTap: () {
            controller.fetchCategories();
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: AppIcon(icon: AppIcons.settings),
          )
        ],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              if (controller.listCategories.isNotEmpty) _listCategories(),
            ],
          );
        },
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
