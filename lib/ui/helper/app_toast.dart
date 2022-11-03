import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_colors.dart';
import '../widgets/app_text_display.dart';

class AppToast{
  static void toast({required String msg, required context}){
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.blueGray,
      textColor: Colors.black.withOpacity(0.5),
    );
  }
}