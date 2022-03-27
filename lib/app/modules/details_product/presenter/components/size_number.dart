import 'package:flutter/material.dart';
import 'package:store/core/theme/theme.dart';

class SizeNumber extends StatelessWidget {
  const SizeNumber({Key? key, required this.size}) : super(key: key);
  final int size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey))),
      child: Center(child: Text('$size', style: title)),
    );
  }
}
