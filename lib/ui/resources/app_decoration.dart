import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppBoxDecoration {
  static BoxDecoration get gradientWhite00White => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.49999994234504164,
            3.6497318709445835e-24,
          ),
          end: Alignment(
            0.49999994234504164,
            0.9999999999999999,
          ),
          colors: [
            AppColors.white00,
            AppColors.white,
          ],
        ),
      );
  static BoxDecoration get outlineWhite => BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.white,
          width:
            1.00.w,
        ),
      );
  static BoxDecoration get fillWhite => BoxDecoration(
        color: AppColors.white,
      );
  static BoxDecoration get gradientWhite91White6e => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5000000655315359,
            -2.634377316984571e-10,
          ),
          end: Alignment(
            0.5013774095809667,
            0.9999999819177918,
          ),
          colors: [
            AppColors.white91,
            AppColors.white6e,
          ],
        ),
      );
  static BoxDecoration get gradientWhite91White6e1 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.500000065917009,
            -2.564509646307833e-10,
          ),
          end: Alignment(
            0.501377410066351,
            0.9999999767312988,
          ),
          colors: [
            AppColors.white91,
            AppColors.white6e,
          ],
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder3 = BorderRadius.circular(3.00.r);
  static BorderRadius roundedBorder16 = BorderRadius.circular(16.00.r);
  static BorderRadius roundedBorder32 = BorderRadius.circular(32.00.r);
}
