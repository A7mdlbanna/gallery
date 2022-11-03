import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery/ui/helper/index.dart';
import 'package:gallery/ui/screens/login_screen.dart';

import '../resources/index.dart';
import 'app_button.dart';
import 'app_text_display.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({Key? key, this.isLogin = true}) : super(key: key);

  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            SvgPicture.asset(AppImages.networkError),
            AppText(
              translation: AppStrings.networkError,
              size: 25.sp,
            ),
            50.heightBox,
            AppButton(
              height: 50.h,
              translation: AppStrings.tryAgain,
              color: AppColors.blue,
              fontSize: 20.sp,
              onTap: () => isLogin ? pop(context) : popALlAndPushPage(context, LoginScreen()),
            )
          ],
        ),
      ),
    );
  }
}
