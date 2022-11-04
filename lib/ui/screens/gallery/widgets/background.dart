import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../../resources/index.dart';

background(){
  return Stack(
    children: [
      Image.asset(AppImages.galleryBackground, fit: BoxFit.cover,),
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Image.asset(AppImages.galleryForeground, fit: BoxFit.cover),
        ),
      ),

    ],
  );
}