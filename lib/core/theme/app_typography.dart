import 'package:flutter/material.dart';
import 'app_colors.dart';

late BuildContext buildContext;

void setBuildContext(BuildContext context) {
  buildContext = context;
}

TextStyle appBarTitle = const TextStyle(
  fontSize: 17,
  height: 22 / 17,
  fontStyle: FontStyle.normal,
  color: AppColors.primary,
  letterSpacing: -0.41,
);

TextStyle button1 = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

TextStyle button2 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.normal,
);

TextStyle errorTextField = TextStyle(
  fontSize: 12,
  height: 16 / 12,
  color: AppColors.red.shade400,
  fontStyle: FontStyle.normal,
);

TextStyle title = const TextStyle(
  fontSize: 16,
  height: 24 / 16,
  color: AppColors.primary,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
);

TextStyle subTitle = TextStyle(
  fontSize: 14,
  height: 24 / 16,
  color: AppColors.primary[300],
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
);

TextStyle caption1 = TextStyle(
  color: AppColors.neutral[600],
  fontSize: 12,
  height: 14 / 12,
  fontWeight: FontWeight.w400,
);
TextStyle caption2 = const TextStyle(
  color: AppColors.primary,
  fontSize: 14,
  height: 15.4 / 14,
  fontWeight: FontWeight.w500,
);
