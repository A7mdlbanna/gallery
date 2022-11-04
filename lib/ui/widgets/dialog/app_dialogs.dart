import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/ui/helper/index.dart';
import 'package:gallery/ui/resources/app_colors.dart';
import 'package:gallery/ui/resources/app_text_styles.dart';
import '../../resources/app_decoration.dart';
import 'alert_dialog.dart';

class AppDialogs {
  static Future<void> showAlertDialog(BuildContext context, {
    String? headerText,
    required List<Widget> children,
    String? confirmText,
    String? cancelText,
    void Function()? onConfirm,
    void Function()? onCancel,
    BuildContext? payContext,
    bool dismissible = true,
    hasActions = false,
  }) async {
    await AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      padding: EdgeInsets.zero,
      bodyHeaderDistance: 0.0,
      dialogBorderRadius: BorderRadiusStyle.roundedBorder32,
      dialogBackgroundColor: Colors.transparent,
      outterPadding: EdgeInsets.symmetric(horizontal: 38.w),
      isDense: true,
      body: AppAlertDialog(
        headerText: headerText,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        hasActions: hasActions,
        payContext: payContext,
        children: children,
      ),
      dialogType: DialogType.noHeader,
      dismissOnBackKeyPress: dismissible,
      dismissOnTouchOutside: dismissible,
    ).show();
  }
}
