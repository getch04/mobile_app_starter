//Custom class in project directory
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static buildCustomSnackbar(
      {required String title,
      required String msg,
      IconData? icon,
      Color? bgrdColor}) {
    Get.snackbar(title, msg,
        icon: Icon(icon ?? Icons.info_outline, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: bgrdColor ?? Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.vertical,
        forwardAnimationCurve: Curves.easeOutBack,
        progressIndicatorBackgroundColor: Colors.amber,
        reverseAnimationCurve: Curves.easeOutBack);
  }
}
