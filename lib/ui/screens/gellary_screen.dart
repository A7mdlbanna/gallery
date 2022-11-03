import '../resources/index.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.galleryBackground, fit: BoxFit.cover,),
          Column(
            children: [

            ],
          ),
        ],
      ),
    );
  }
}
