import 'package:flutter/material.dart';

class ContainerColor extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const ContainerColor({
    Key? key,
    required this.isSelected,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: isSelected ? Colors.grey[200] : Colors.transparent,
          ),
        ),
        Positioned(
          left: 7.5,
          top: 7.5,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
