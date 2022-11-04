import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppBoxDecoration {
  static BoxDecoration galleryActions = BoxDecoration(
    color: AppColors.white.withOpacity(0.3),
    borderRadius: BorderRadiusStyle.roundedBorder16,
  );
  static BoxDecoration logout = BoxDecoration(
    color: AppColors.red,
    gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [AppColors.red, AppColors.deepRed]),
    borderRadius: BorderRadiusStyle.roundedBorder10,
  );
  static BoxDecoration upload = BoxDecoration(
    color: AppColors.amber,
    gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [AppColors.amber, AppColors.orange]),
    borderRadius: BorderRadiusStyle.roundedBorder10,
  );
}
class BorderRadiusStyle {
  static BorderRadius roundedBorder3 = BorderRadius.circular(3.00.r);
  static BorderRadius roundedBorder16 = BorderRadius.circular(16.00.r);
  static BorderRadius roundedBorder10 = BorderRadius.circular(10.00.r);
  static BorderRadius roundedBorder32 = BorderRadius.circular(32.00.r);
}
