import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery/ui/helper/index.dart';

import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
    this.color,
    this.radius,
    this.padding,
    this.loading = false,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double? radius;
  final EdgeInsets? padding;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading ? Center(child: CircularProgressIndicator.adaptive(),) : ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppColors.white.withOpacity(0.35),
            borderRadius: radius != null ? BorderRadius.circular(radius!) : AppCorners.xxxlBorder,
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.symmetric(horizontal: 31.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
