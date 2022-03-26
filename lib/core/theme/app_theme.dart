import 'package:flutter/material.dart';
import 'package:store/core/theme/theme.dart';

class AppTheme {
  final BuildContext context;
  AppTheme(this.context);

  final ThemeData theme = ThemeData(
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.neutral,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.neutral,
      iconTheme: IconThemeData(color: AppColors.icons),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.neutral,
  );
}
