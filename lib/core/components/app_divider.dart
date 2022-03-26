import 'package:flutter/material.dart';
import 'package:store/core/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.secundary, thickness: 0.4, height: 5);
  }
}
