
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/core/utils/color_manger.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/snack_bar.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [

            Image.asset(
              AppAssets.background,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,),

            Form(
              key: context.read<LoginCubit>().formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 41.0.w,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CustomText(
                      text: 'My\nGallery',
                      size: 50,
                      inCenter: true,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    verticalSpace(38),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 6,
                          sigmaY: 6,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 31.w),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Column(
                            children: [
                              const CustomText(
                                text: 'LOG IN',
                                size: 32,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                              verticalSpace(38),


                              CustomTextFormField(
                                controller: context.read<LoginCubit>().emailController,
                                hint: 'Email',
                                radius: 22,
                                withBorder: false,
                                inputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your email';
                                  } else {
                                    return null;
                                  }
                                },
                                context: context,
                              ),

                              verticalSpace(38),

                              CustomTextFormField(
                                controller: context.read<LoginCubit>().passwordController,
                                hint: 'Password',
                                radius: 22,
                                withBorder: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your password';
                                  } else {
                                    return null;
                                  }
                                },
                                context: context,
                              ),


                              verticalSpace(70),

                              BlocBuilder<LoginCubit, LoginStates>(
                                builder: (context, state) {
                                  return state is LoginLoadingState
                                  ? const CustomLoading()
                                  : CustomButton(
                                    text: 'Submit',
                                    radius: 10.r,
                                    height: 46.h,
                                    function: () {
                                      context.read<LoginCubit>().validateInputsAndLogin();
                                    },
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),



                    /// Listen for screen states.
                    BlocListener<LoginCubit, LoginStates>(
                      listenWhen: (previous, current) => current is LoginErrorState || current is LoginSuccessState,
                      listener: (context, state) {
                        if(state is LoginErrorState){
                          CustomSnackBarHandler.showCustomSnackBar(
                              context: context, state: SnackBarStates.error,
                            text: state.error
                          );
                        }else if(state is LoginSuccessState){
                          CustomSnackBarHandler.showCustomSnackBar(
                              context: context, state: SnackBarStates.success, text: 'Welcome back,');
                          context.pushNamedAndRemoveUntil(Routes.home, predicate: (p)=> false);
                        }
                      },
                      child: const SizedBox.shrink(),
                    )
                  ],
                ),
              ),
            ),
            
            PositionedDirectional(
              start: 60.w,
                top: 60.h,
                child: Image.asset(AppAssets.cameraLogin, width: 100.w,),
            )
          ],
        ),
      ),
    );
  }
}