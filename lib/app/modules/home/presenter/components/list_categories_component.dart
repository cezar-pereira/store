import 'package:flutter/material.dart';
import 'package:store/core/theme/theme.dart';

import '../../domain/entities/category_entity.dart';

class ListCategoriesComponent extends StatefulWidget {
  const ListCategoriesComponent(
      {Key? key, required this.list, required this.onChanged})
      : super(key: key);
  final List<CategoryEntity> list;
  final ValueChanged onChanged;

  @override
  State<ListCategoriesComponent> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategoriesComponent> {
  late CategoryEntity selected;

  @override
  void didUpdateWidget(covariant ListCategoriesComponent oldWidget) {
    if (widget != oldWidget) selected = widget.list.first;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    selected = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = widget.list[index];

                widget.onChanged(selected);
              });
            },
            child: Center(
                child: Text(
              widget.list[index].name,
              style: widget.list[index] == selected ? caption2 : caption1,
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 20),
      ),
    );
  }
}
