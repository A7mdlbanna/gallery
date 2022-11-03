import 'package:flutter/material.dart';

import '../resources/index.dart';
import '../widgets/index.dart';

class AppSnackBar {
  static void showSnackBar(
    String text, {
      required context,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(translation: text,),
        duration: duration,
        backgroundColor: Colors.red,
      ),
    );
  }
}
