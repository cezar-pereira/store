import 'package:flutter/material.dart';
import 'package:store/core/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.secundary, height: 0.8);
  }
}
