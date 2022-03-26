import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

Future<T?> showAppLoading<T>({required BuildContext context}) async {
  return showCupertinoModalPopup(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              color: AppColors.neutral, borderRadius: BorderRadius.zero),
          child: const CupertinoActivityIndicator(radius: 15),
        ),
      ),
    ),
  );
}
