

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/utils/app_constants.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import 'package:promina_task/src/upload_image/logic/upload_image_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/snack_bar.dart';



void showEnsureUploadImageDialog({
  required BuildContext context,
  required Function function
})=> showDialog(
    context: context,
    builder: (context)=> AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content:ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 30.w),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(32.r),
                border: Border.all(color: Colors.white, width: 1.25)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const CustomText(
                  text: 'Upload image to gallery',
                  size: 20,
                  fontWeight: FontWeightHelper.semiBold,
                  color: AppColors.black,
                ),
                verticalSpace(44),
                BlocConsumer<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    return state is UploadToGalleryLoadingState
                        ? const CustomLoading()
                        :  CustomButton(
                        text: 'Upload',
                        textColor: AppColors.blackColor,
                        withBorder: false,
                        icon: AppAssets.camera,
                        fontWeight: FontWeightHelper.bold,
                        radius: 22,
                        fontSize: 25,
                        color: const Color(0xffEBF6FF),
                        height: 65,
                        function: (){
                          function();
                        });
                  },

                  listener: (context, state){
                    if(state is UploadToGalleryErrorState){
                      context.pop();
                      CustomSnackBarHandler.showCustomSnackBar(context: context, text: 'Error, please try again');
                    }else if(state is UploadToGallerySuccessState){
                      context.pop();
                      CustomSnackBarHandler.showCustomSnackBar(context: context,state: SnackBarStates.success, text: 'Image uploaded to gallery successfully');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    )
);
