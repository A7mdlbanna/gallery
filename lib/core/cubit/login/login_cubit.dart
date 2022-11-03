import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery/core/network/network_connection.dart';
import 'package:gallery/ui/resources/app_routes.dart';
import '../../../ui/helper/app_snack_bar.dart';
import '../../../ui/helper/app_toast.dart';
import '../../../ui/helper/navigator.dart';
import '../../../ui/resources/app_strings.dart';
import '../../dto/login.dart';
import '../../model/user.dart';
import '../../repository/auth_repository.dart';
import '../../repository/user_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static UserData? user;
  static bool? isFirstTime;
  static final AuthRepository _authRepository = AuthRepository();
  static final UserRepository _userRepository = UserRepository();

  static void onAppStart() {
    user = _userRepository.getUser();
    isFirstTime = _authRepository.isFirstTime();
  }

  Future<void> login({required context}) async {
    dismissKeyboard(context);
    ///Network Check
    if(source == ConnectivityResult.none){
      AppSnackBar.showSnackBar(AppStrings.networkError, context: context);
      return;
    }
    emit(LoginLoading());
    try {
      Response response = await _userRepository.login(loginRequest: LoginDTO(email: userNameController.text, password: passwordController.text));
      if (response.statusCode! < 300) {
        print(response.data);
        if (response.data['error_message'] != null) {
          AppSnackBar.showSnackBar(response.data['error_message'], context: context);
          emit(LoginFailed());
          return;
        }
        final userWithToken = User.fromJson(response.data);
        user = userWithToken.user;
        _authRepository.setToken(userWithToken.token??'');
        await _userRepository.setUser(user!);
        await _authRepository.setFirstTime(false);
        AppToast.toast(msg: AppStrings.loginSuccess, context: context);
        pushNameReplacement(context, AppRoutes.galleryScreen);
        emit(LoginSuccess());
      } else {
        AppSnackBar.showSnackBar(AppStrings.loginFailed, context: context);
        emit(LoginFailed());
      }
    } on Exception catch (e) {
      AppSnackBar.showSnackBar(AppStrings.loginFailed, context: context);
      emit(LoginFailed());
    }
  }

  void logout() async {
    isFirstTime = true;
    _authRepository.setFirstTime(true);
    await _userRepository.removeUser();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validEmail = false;
}
