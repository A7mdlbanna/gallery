import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/app_colors.dart';
import '../../widgets/app_card.dart';

class GalleryLoading extends StatelessWidget {
  const GalleryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 25.w,
      crossAxisSpacing: 25.h,
      children: List.generate(
        15,
        (index) => Shimmer.fromColors(
          baseColor: AppColors.purple,
          highlightColor: AppColors.purple.withOpacity(0.5),
          child: Container(
            color: AppColors.purple,
          ),
        ),
      ),
    );
  }
}
