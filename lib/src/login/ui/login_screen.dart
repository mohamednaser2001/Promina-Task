
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import '../../../core/helpers/spacing.dart';
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: context.read<LoginCubit>().formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 70.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomText(
                      text: 'Login',
                      size: 28,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpace(80),


                    CustomTextFormField(
                      controller: context.read<LoginCubit>().emailController,
                      hint: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your email';
                        } else {
                          return null;
                        }
                      },
                      context: context,
                    ),

                    verticalSpace(30),

                    CustomTextFormField(
                      controller: context.read<LoginCubit>().passwordController,
                      hint: 'Password',
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
                          text: 'Login',
                          radius: 46.r,
                          function: () {
                            context.read<LoginCubit>().validateInputsAndLogin();
                          },
                        );
                      }
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
          ),
        ),
      ),
    );
  }
}