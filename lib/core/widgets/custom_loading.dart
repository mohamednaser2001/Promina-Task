import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/color_manger.dart';



class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 40.h,
            child: const CircularProgressIndicator(
              color: AppColors.mainBlue,
              strokeWidth: 5,
            )) //Lottie.asset('assets/lottie/loading.json', height: 40.h)
    );
  }
}
