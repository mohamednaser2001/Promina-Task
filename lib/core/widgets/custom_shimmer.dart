

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key, required this.height, required this.width, this.radius=0.0, this.color}) : super(key: key);
  final double height;
  final double width;
  final double radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: color??Colors.grey[400],
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }
}