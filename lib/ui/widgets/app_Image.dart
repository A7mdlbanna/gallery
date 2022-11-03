import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';
import '../resources/app_images_path.dart';

class AppImage extends StatelessWidget {
  AppImage({
    this.image,
    this.imagePath,
    this.hideIfNotFound = false,
    this.width = 20,
    this.height,
    this.radius,
    this.border,
    this.padding,
    this.boxFit = BoxFit.cover,
    this.placeholder,
    this.color,
    this.backgroundColor = Colors.transparent,
    this.reSize = true,
    this.icon = false,
    this.onTap,
    this.coloredImage = true,
    this.giveSize = true,
  });
  String? image;
  String? imagePath;
  double width;
  double? height;
  BoxFit boxFit;
  double? radius;
  bool hideIfNotFound;
  bool reSize;
  final EdgeInsetsGeometry? padding;
  String? placeholder;
  Color? color;
  BoxBorder? border;

  Color backgroundColor;
  bool icon;
  void Function()? onTap;

  bool coloredImage;
  bool giveSize;

  @override
  Widget build(BuildContext context) {
    if (image == null && imagePath == null) return errorImage();
    return Container(
      width: giveSize ? ScreenUtil().setWidth(width) : null,
      height: giveSize ? ScreenUtil().setHeight(height??width) : null,
      padding: padding,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: image != null ? buildNetworkImage() : InkWell(
          onTap: onTap, child: buildAssetsImage()
        ),
      ),
    );
  }

  Widget buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: image!,
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(width),
      fit: boxFit,
      progressIndicatorBuilder: (context, child, loadingProgress) => loadingImage(),
      errorWidget: (BuildContext context, __, ___,) => errorImage());
  }

  dynamic buildAssetsImage() {
    return SvgPicture.asset(
        imagePath!,
        width: width,
        height: height??width,
        fit: boxFit,
        color: color??AppColors.blueGray
    );
  }

  Widget loadingImage(){
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(width),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }
  Widget errorImage() {
    if (hideIfNotFound) return Container();
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(width),
      padding: EdgeInsets.all(12.0.w),
      decoration: BoxDecoration(
          color: backgroundColor,
      ),
     child: Center(
        child: SvgPicture.asset(
                placeholder??AppImages.imageNotFound,
                width: width / 2,
                height: width / 2,
                fit: boxFit,
                color: AppColors.blueGray
              )
      ),
    );
  }
}
