import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/cubit/bloc_provider.dart';
import 'package:gallery/core/cubit/network/network_cubit.dart';
import 'package:gallery/ui/helper/screen_util_init.dart';
import 'package:gallery/ui/screens/gellary_screen.dart';
import 'package:gallery/ui/screens/login_screen.dart';

import 'core/repository/auth_repository.dart';
import 'ui/helper/index.dart';
import 'ui/resources/index.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenInit(
      builder: (BuildContext context, Widget? child) =>
          BlocBuilder<NetworkCubit, NetworkState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Gallery',
                initialRoute: AppRoutes.initialRoute,
                onGenerateRoute: RouteGenerator.generateRoute,
                home: AuthRepository().isFirstTime() ? LoginScreen() : GalleryScreen(),
              );
            },
          ),
    );
  }
}