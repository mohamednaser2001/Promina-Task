
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/utils/app_constants.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/widgets/custom_button.dart';

void showUploadImageDialog({
  required BuildContext context,
  required Function galleryFunction,
  required Function cameraFunction
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

                CustomButton(
                    text: 'Gallery',
                    color: const Color(0xffEFD8F9),
                    withBorder: false,
                    textColor: AppColors.blackColor,
                    icon: AppAssets.gallery,
                    height: 65,
                    radius: 22,
                    fontSize: 27,
                    fontWeight: FontWeightHelper.bold,
                    function: (){
                      galleryFunction();
                    }),
                verticalSpace(44),
                CustomButton(
                    text: 'Camera',
                    textColor: AppColors.blackColor,
                    withBorder: false,
                    icon: AppAssets.camera,
                    fontWeight: FontWeightHelper.bold,
                    radius: 22,
                    fontSize: 27,
                    color: const Color(0xffEBF6FF),
                    height: 65,
                    function: (){
                      cameraFunction();
                    }),
              ],
            ),
          ),
        ),
      ),
    )
);