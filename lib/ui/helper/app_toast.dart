import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_colors.dart';

class AppToast{
  static void toast({required String msg, required context}){
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.blueGray.withOpacity(0.5),
      textColor: Colors.white,
    );
  }
}