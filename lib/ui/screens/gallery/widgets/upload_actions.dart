import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/cubit/gallery/gallery_cubit.dart';
import 'package:gallery/ui/helper/navigator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helper/size_extension.dart';
import '../../../resources/index.dart';
import '../../../widgets/app_text_display.dart';

class UploadAction extends StatelessWidget {
  const UploadAction({Key? key, required this.isGallery, required this.context}) : super(key: key);

  final bool isGallery;
  final BuildContext context;
  @override
  Widget build(BuildContext _) {
    return InkWell(
      onTap: () async{
        pop(context);
        XFile? image = await ImagePicker().pickImage(source: isGallery ? ImageSource.gallery : ImageSource.camera);
        BlocProvider.of<GalleryCubit>(context).upload(image, context);
      },
      child: Container(
        width: 184.w, height: 67.h,
        decoration: BoxDecoration(
            color: isGallery ? AppColors.purple.withOpacity(0.7) : AppColors.cyan.withOpacity(0.7),
            borderRadius: AppCorners.xxxlBorder
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(isGallery ? AppImages.gallery : AppImages.camera),
            AppText(text: isGallery ? AppStrings.gallery : AppStrings.camera, style: AppTextStyles.txtSemiBold27,)
          ],
        ),
      ),
    );
  }
}