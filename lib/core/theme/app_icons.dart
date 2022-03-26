import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppIcons {
  static const favorite = Icons.star;
  static const favoriteOutlined = Icons.star_border_outlined;
}

extension AppIconsExt on String {
  AppIcon icon({
    String? icon,
    BoxFit? fit,
    Color? color,
    double? size,
    Function()? onTap,
  }) {
    return AppIcon(
      icon: this,
      fit: fit,
      color: color,
      size: size,
      onTap: onTap,
    );
  }
}

class AppIcon extends StatelessWidget {
  final String? icon;
  final BoxFit? fit;
  final Color? color;
  final double? size;
  final VoidCallback? onTap;

  const AppIcon({
    Key? key,
    this.icon,
    this.fit,
    this.color,
    this.size,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        AppIcons.favorite,
        size: size ?? 24,
        color: color ?? AppColors.icons,
      ),
    );
  }
}
