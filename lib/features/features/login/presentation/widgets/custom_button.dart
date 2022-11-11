import 'package:flutter/material.dart';

import '../../../../../core/core/app_colors.dart';

class AppButtons {
  static ElevatedButton buildElevatedButton(
      {required String text, required VoidCallback voidmethod}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(340, 50),
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primaryColor),
        onPressed: voidmethod,
        child: Text("$text"));
  }

  static TextButton buildTextButton(
      {required BuildContext context,
      required String pageName,
      required String buttonLabel,
      Color color = Colors.white}) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, pageName, (route) => false);
        },
        child: Text(
          buttonLabel,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ));
  }
}
