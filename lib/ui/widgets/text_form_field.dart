import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/ui/resources/app_colors.dart';

import '../resources/app_text_styles.dart';

class AppFormField extends StatelessWidget {
  const AppFormField(
      {Key? key,
      this.label,
      this.labelStyle,
      this.hint,
      this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.onFieldSubmitted,
      this.validate,
      required this.context,
      this.formKey,
      this.controller,
      this.contentPadding,
      this.radius,
      this.boxHeight,
      this.textAlign,
      this.enabled,
      this.textColor,
      this.onTap,
      this.textDirection,
      this.readOnly = false,
      this.boxColor, this.obscureText = false,
      this.focusNode,
      this.size = 18,
      this.height = 1.2,
      this.autofocus = false
      })
      : super(key: key);

  final String? label;
  final TextStyle? labelStyle;
  final String? hint;
  final bool autofocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double? size;
  final double? height;
  final Function(String val)? onChanged;
  final Function(String val)? onFieldSubmitted;
  final String? Function(String? val)? validate;
  final BuildContext context;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final double? radius;
  final double? boxHeight;
  final TextAlign? textAlign;
  final bool? enabled;
  final Color? textColor;
  final void Function()? onTap;
  final TextDirection? textDirection;
  final bool readOnly;
  final Color? boxColor;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        height: boxHeight,
        child: TextFormField(
          focusNode: focusNode,
          autofocus: autofocus,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textAlign: textAlign ?? TextAlign.start,
          textDirection: textDirection,
          readOnly: readOnly,

          enabled: enabled,

          onTap: onTap,

          inputFormatters: [
            if(keyboardType == TextInputType.number)...[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ]
          ],

          style: TextStyle(
            color: textColor,
            fontSize: size?.sp,
            height: height?.h,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: boxColor ?? AppColors.gray,
            contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 21.w),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(radius ?? 22.r),
            ),

            labelText: label,
            labelStyle: labelStyle ?? AppTextStyles.txtSemiBold16,

            hintText: hint,
            hintStyle: AppTextStyles.txtRobotoRegular16,
          ),
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validate,
        ),
      ),
    );
  }
}