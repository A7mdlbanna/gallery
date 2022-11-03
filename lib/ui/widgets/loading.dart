import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/app_colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({this.size = 30});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCube(
        size: size,
        color: AppColors.blue,
      ),
    );
  }
}
