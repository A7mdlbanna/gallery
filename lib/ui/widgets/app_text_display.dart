import 'package:flutter/material.dart';
import 'package:gallery/ui/helper/index.dart';
import '../resources/index.dart';

class AppText extends StatelessWidget {
  const AppText(
      {this.color,
      this.size,
      this.text,
      this.fontFamily,
      this.decoration,
      this.translation,
      this.overflow = TextOverflow.ellipsis,
      this.style,
      this.leading,
      this.trailing,
      this.trailingAlignment,
      this.suffixTranslation,
      this.prefixTranslation,
      this.softWrap = false,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.isUpper = false,
      this.addText,
      this.onTap,
      this.backgroundColor,
      this.backgroundColorPadding,
        this.padding = EdgeInsets.zero, this.fittedText = false,
      });
  final Color? color;
  final double? size;
  final String? text;
  final String? suffixTranslation;
  final String? prefixTranslation;
  final String? translation;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final bool? isUpper;
  final bool? softWrap;
  final int maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment? trailingAlignment;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final String? addText;
  final Color? backgroundColor;
  final EdgeInsets? backgroundColorPadding;
  final dynamic padding;
  final bool fittedText;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ?? AppTextStyles.txtRobotoRegular16;
    // if (color != null) {
    //   textStyle = textStyle.copyWith(color: color, fontSize: size, fontWeight: fontWeight);
    // }else{
    //   textStyle = textStyle.copyWith(fontSize: size, fontWeight: fontWeight, color: AppColors.black);
    //
    // }
    if (leading != null) {
      return Row(
        children: <Widget>[
          leading!,
          16.widthBox,
          buildText(context, textStyle),
          if(trailing != null) ...[
            const Spacer(),
            trailing!
          ]
        ],
      );
    }

    if (trailing != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Row(
          mainAxisAlignment: trailingAlignment ?? MainAxisAlignment.start,
          children: <Widget>[fittedText ? Expanded(child: buildText(context, textStyle)) : buildText(context, textStyle), trailing is Flexible ? 10.widthBox : fittedText ? const SizedBox.shrink() : const Spacer(), fittedText ? Align(alignment: AlignmentDirectional.centerEnd, child: trailing,) : trailing!],
        ),
      );
    }
    return buildText(context, textStyle);
  }

  Widget buildText(BuildContext context, TextStyle textStyle) {
    if(color == AppColors.white)textStyle.copyWith(color: null);
    String displayText = translation != null && translation!.isNotEmpty ? translation! : text ?? '';
    if (prefixTranslation != null) {
      displayText = prefixTranslation! + ' ' + displayText;
    }
    if (suffixTranslation != null) {
      displayText = displayText + ' ' + suffixTranslation! + ' ';
    }
    if (addText != null && addText!.isNotEmpty) displayText += '$addText';

    if(backgroundColor != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 30.w,
            maxWidth: 70.w,
            minHeight: 20.h,
            maxHeight: 30.h
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: AppCorners.medBorder
          ),
          child: Padding(
            padding: backgroundColorPadding?? EdgeInsets.all(12.w),
            child: Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  displayText,
                  textAlign: textAlign,
                  overflow: overflow,
                  maxLines: maxLines,
                  softWrap: softWrap,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: padding,
      child: Text(
        displayText,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        softWrap: softWrap,
        style: maxLines > 1 ? textStyle.copyWith(height: 1.h) : textStyle,
      ),
    );
  }
  // static String translate(context, text) => AppLocalizations.of(context).translate(text!);
}
