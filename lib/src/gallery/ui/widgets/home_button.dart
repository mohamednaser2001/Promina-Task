

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:promina_task/core/utils/color_manger.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/widgets/custom_text.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key,
  required this.text,
    required this.iconPath,
     required this.function
  }) : super(key: key);
  final String text;
  final String iconPath;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        function();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            horizontalSpace(10),
            CustomText(
              text: text,
              size: 20,
              color: AppColors.blackColor,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ],
        ),
      ),
    );
  }
}