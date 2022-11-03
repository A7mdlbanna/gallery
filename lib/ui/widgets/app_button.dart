import 'package:flutter/material.dart';
import 'package:gallery/ui/helper/index.dart';
import '../resources/index.dart';
import 'index.dart';

class AppButton extends StatelessWidget {
  AppButton({
    this.height,
    this.translation,
    required this.color,
    this.textColor = Colors.white,
    this.onTap,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.fontFamily,
    this.textDecoration,
    this.borderRadius,
    this.padding,
    this.decoration,
    this.borderColor,
    this.center = false,
    this.centerText = true,
    this.isLoading = false,
    this.enabled = true,
    this.style,
    this.width, this.suffix, this.preIcon, this.fittedText = false,
  });
  final bool center;
  final bool centerText;
  final String? translation;
  final Color textColor;
  final double fontSize;
  final double? width;
  final double? height;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final BoxDecoration? decoration;
  final Widget? suffix;
  final Widget? preIcon;

  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  Color color;
  Color? borderColor;
  GestureTapCallback? onTap;
  final bool isLoading;
  final bool enabled;
  BorderRadiusGeometry? borderRadius;
  final bool fittedText;

  @override
  Widget build(BuildContext context) {
    if (!enabled) color = AppColors.gray.withOpacity(0.5);
    if (isLoading) return const AppLoading();
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          // padding: padding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration:
              decoration ?? BoxDecoration(color: color, borderRadius: borderRadius ?? AppCorners.lgBorder, border: borderColor == null ? null : Border.all(color: borderColor!)),
          child: Align(
            alignment: centerText ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: centerText ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: preIcon != null ? 15.w : 7.0.w),
              child: AppText(
                translation: translation,
                textAlign: center ? TextAlign.center : TextAlign.start,
                color: textColor,
                leading: preIcon,
                trailing: suffix,
                fittedText: fittedText,
                style: style ?? AppTextStyles.txtRobotoRegular16.copyWith(color: textColor, fontWeight: fontWeight, fontSize: fontSize.sp),
              ),
            ),
          )),
    );
  }
}