import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alert_dialog.dart';

class AppDialogs {
  static Future<void> showAlertDialog(BuildContext context, {
    required String headerText,
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
