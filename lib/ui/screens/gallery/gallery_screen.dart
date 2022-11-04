import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/cubit/gallery/gallery_cubit.dart';
import 'package:gallery/core/cubit/login/login_cubit.dart';
import 'package:gallery/ui/helper/index.dart';
import 'package:gallery/ui/screens/gallery/gallery_loading.dart';
import 'package:gallery/ui/widgets/app_text_display.dart';

import '../../resources/index.dart';
import 'package:flutter/material.dart' hide Actions;

import '../../widgets/app_Image.dart';
import 'widgets/index.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginCubit.onAppStart();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));

    return BlocProvider(
      create: (context) => GalleryCubit()..init(context),
      child: BlocBuilder<GalleryCubit, GalleryState>(
        builder: (context, state) {
          GalleryCubit gallery = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  background(),
                  Positioned(right: 32.w, top: 26.h, child: Image.asset(AppImages.user, width: 66.w, height: 66.h,)),
                  Container(
                    height: context.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          39.heightBox,
                          Align(alignment: Alignment.centerLeft, child: Text('Welcome\n${LoginCubit.user?.name??'User'}', style: AppTextStyles.txtRobotoRegular32)),
                          42.heightBox,
                          Actions(),
                          Expanded(
                            child: state is GalleryLoading ? GalleryLoading() : gallery.gallery.isEmpty ? Center(child: Text('Your Gallery is Empty,\nlets save some moments', style: AppTextStyles.txtSemiBold27, textAlign: TextAlign.center,)) : GridView.count(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 3,
                              mainAxisSpacing: 25.w,
                              crossAxisSpacing: 25.h,
                              children: List.generate(gallery.gallery.length, (index) => AppImage(image: gallery.gallery[index], radius: 15.r,)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
