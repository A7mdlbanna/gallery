import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/ui/helper/index.dart';
import '../../resources/index.dart';
import '../index.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required this.headerText,
    required this.children,
    this.confirmText,
    this.cancelText,
    this.hasActions = false,
    this.hasHeader = false,
    this.payContext,
    this.onConfirm,
    this.onCancel,

  });

  final String headerText;
  final String? confirmText;
  final String? cancelText;
  final bool hasActions;
  final bool hasHeader;
  final List<Widget> children;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final BuildContext? payContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if(hasHeader)_buildHeader(context),
          _buildPopUpContent(context),
          if(hasActions) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  if(confirmText != null)_buildConfirmButton(context),
                  if(confirmText != null && cancelText != null)5.widthBox,
                  if(cancelText != null) _buildCancelButton(context),
                ],
              ),
            ),
            15.heightBox,
          ]
        ],
      ),
    );
  }

  Widget _buildPopUpContent(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.orange400,
      ),
      padding: EdgeInsets.symmetric(horizontal:10.w, vertical: 3.h),
      child: AppText(
        translation: headerText,
        color: AppColors.white,
        style: AppTextStyles.txtRobotoRegular16,
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Expanded(
      child: AppButton(
        translation: confirmText,
        onTap: onConfirm ?? () => pop(context),
        color: AppColors.blue,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Expanded(
      child: AppButton(
        translation: cancelText,
        onTap: onCancel ?? () => pop(context),
        color: AppColors.gray,
      ),
    );
  }
}
