import 'package:flutter/material.dart';

import '../helper/index.dart';
import 'app_colors.dart';

class AppCorners {
  static double sm = 3.r;
  static Radius smRadius = Radius.circular(sm);
  static BorderRadius smBorder = BorderRadius.all(smRadius);

  static double med = 8.r;
  static BorderRadius medBorder = BorderRadius.all(medRadius);
  static Radius medRadius = Radius.circular(med);

  static double lg = 10.r;
  static Radius lgRadius = Radius.circular(lg);
  static BorderRadius lgBorder = BorderRadius.all(
    lgRadius,
  );

  static double xlg = 14.r;
  static BorderRadius xlgBorder = BorderRadius.all(xlgRadius);
  static Radius xlgRadius = Radius.circular(xlg);

  static double xxl = 16.r;
  static Radius xxlRadius = Radius.circular(xxl);
  static BorderRadius xxlBorder = BorderRadius.all(xxlRadius);

  static double xxxl = 20.r;
  static BorderRadius xxxlBorder = BorderRadius.all(xxxlRadius);
  static Radius xxxlRadius = Radius.circular(xxxl);
}

abstract class AppTextStyles {
  static TextStyle txtRobotBold50 = TextStyle(
    color: AppColors.black4a,
    fontSize: 50.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtRobotBold30 = TextStyle(
    color: AppColors.black4a,
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: AppColors.blueGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular32 = TextStyle(
    color: AppColors.black4a,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtSemiBold16 = TextStyle(
    // color: AppColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSemiBold20 = TextStyle(
    color: AppColors.black4a,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtSemiBold27 = TextStyle(
    color: AppColors.black4a,
    fontSize: 27.sp,
    fontWeight: FontWeight.w700,
  );
}
