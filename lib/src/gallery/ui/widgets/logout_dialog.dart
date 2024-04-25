

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/color_manger.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/widgets/custom_button.dart';



void logoutDialog({
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
                border: Border.all(color: Colors.white, width: 1.5)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const CustomText(
                  text: 'You want to log out!',
                  size: 24,
                  fontWeight: FontWeightHelper.semiBold,
                  color: AppColors.black,
                ),
                verticalSpace(44),
                CustomButton(
                    text: 'Log out',
                    textColor: AppColors.blackColor,
                    withBorder: false,
                    fontWeight: FontWeightHelper.bold,
                    radius: 16,
                    fontSize: 22,
                    color: const Color(0xffEBF6FF),
                    height: 50,
                    function: (){
                      function();
                    }),
              ],
            ),
          ),
        ),
      ),
    )

);