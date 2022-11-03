import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/app.dart';

import 'core/cubit/bloc_observer.dart';
import 'core/cubit/bloc_provider.dart';
import 'core/utils/api_service.dart';
import 'core/utils/app_local_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  await AppLocalStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  BlocOverrides.runZoned(
        () {
      runApp(
          AppMainBlocProvider(
            child: Gallery(),
          )
      );
    },
    blocObserver: MyBlocObserver(),
  );
}