import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/login_cubit.dart';
import 'network/network_cubit.dart';

class AppMainBlocProvider extends StatelessWidget {
  const AppMainBlocProvider({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkCubit()..init()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: child!,
    );
  }
}
