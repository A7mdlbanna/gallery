import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/cubit/login/login_state.dart';
import 'package:gallery/core/utils/validator.dart';
import 'package:gallery/ui/helper/index.dart';
import 'package:gallery/ui/widgets/app_button.dart';
import 'package:gallery/ui/widgets/app_card.dart';
import 'package:gallery/ui/widgets/app_text_display.dart';
import 'package:gallery/ui/widgets/text_form_field.dart';

import '../../core/cubit/login/login_cubit.dart';
import '../resources/index.dart';

final emailKey = GlobalKey<FormState>();
final passKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit login = BlocProvider.of(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImages.loginBackground, fit: BoxFit.contain,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 41.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        50.heightBox,
                        AppText(text: 'My', style: AppTextStyles.txtRobotBold50,),
                        AppText(text: 'Gallery', style: AppTextStyles.txtRobotBold50,),
                        40.heightBox,
                        AppCard(
                          radius: 32.r,
                          child: Column(
                            children: [
                              50.heightBox,
                              AppText(text: 'LOG IN',
                                  style: AppTextStyles.txtRobotBold30),
                              50.heightBox,
                              AppFormField(
                                formKey: emailKey,
                                context: context,
                                label: 'User Name',
                                controller: login.userNameController,
                                validate: (email) => !validEmail(email??'') ? AppStrings.invalidEmail : null,
                              ),
                              38.heightBox,
                              AppFormField(
                                formKey: passKey,
                                context: context,
                                label: 'Password',
                                obscureText: true,
                                controller: login.passwordController,
                                validate: (pass) => !validPassword(pass??'') ? AppStrings.invalidPass : null,

                              ),
                              38.heightBox,
                              AppButton(
                                onTap: () {
                                  if(emailKey.currentState!.validate() &&
                                  passKey.currentState!.validate())
                                  login.login(context: context);
                                },
                                isLoading: state is LoginLoading,
                                color: AppColors.blue,
                                height: 46.h,
                                translation: 'SUBMIT',
                              ),
                              48.heightBox,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
