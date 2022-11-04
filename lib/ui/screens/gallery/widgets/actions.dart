import 'package:flutter/material.dart';
import 'package:gallery/core/utils/permission_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/cubit/login/login_cubit.dart';
import '../../../helper/index.dart';
import '../../../resources/index.dart';
import '../../../widgets/app_text_display.dart';
import '../../../widgets/dialog/app_dialogs.dart';
import 'upload_actions.dart';

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Action(
            text: AppStrings.logout,
            decoration: AppBoxDecoration.logout,
            arrow: AppImages.arrowLeft,
            onTap: () => LoginCubit().logout(context)),
        Action(
          text: AppStrings.upload,
          decoration: AppBoxDecoration.upload,
          arrow: AppImages.arrowUp,
          onTap: () async{
            await PermissionManager.askForPermission(Permission.storage);
            await PermissionManager.askForPermission(Permission.camera);
            AppDialogs.showAlertDialog(context, children: [
              UploadAction(isGallery: true, context: context),
              42.heightBox,
              UploadAction(isGallery: false, context: context,)
            ]);
          },
        )
      ],
    );
  }
}

class Action extends StatelessWidget {
  const Action(
      {Key? key,
      required this.text,
      required this.decoration,
      required this.arrow,
      this.onTap})
      : super(key: key);

  final String text;
  final BoxDecoration decoration;
  final String arrow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 145,
        height: 40,
        decoration: AppBoxDecoration.galleryActions,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 32.w,
              height: 28.5.h,
              decoration: decoration,
              child: Padding(
                padding: text == AppStrings.upload
                    ? EdgeInsets.symmetric(horizontal: 10.5.w, vertical: 8.h)
                    : EdgeInsets.all(9.52.w),
                child: Image.asset(
                  arrow,
                ),
              ),
            ),
            AppText(
              text: text,
              style: AppTextStyles.txtSemiBold20,
            ),
          ],
        ),
      ),
    );
  }
}
