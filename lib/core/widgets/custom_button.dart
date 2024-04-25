import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color_manger.dart';



class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.function,
    this.color =AppColors.mainBlue,
    this.iconColor =Colors.black,
    this.textColor = Colors.white,
    this.withBorder=false,
    this.radius=50,
    this.height=52,
    this.fontSize=18,
    this.width=double.infinity,
    this.icon,
    this.elevation=2,
    this.fontWeight= FontWeight.w400

  }) : super(key: key);

  String text;
  Function function;
  Color color =AppColors.mainBlue;
  Color iconColor =Colors.black;
  Color textColor = Colors.white;
  bool withBorder=false;
  double radius=50;
  double height=52;
  double fontSize=18;
  double width=double.infinity;
  String? icon;
  double elevation=2;
  FontWeight? fontWeight;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
        side:withBorder ? const BorderSide(width: 2.0,color: AppColors.mainBlue) : BorderSide.none,
      ),
      color: color,
      height:height,
      minWidth:width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icon!=null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(icon!, width: 44.r, fit: BoxFit.cover,),
            ),
          Text(
            text,
            style:GoogleFonts.balooThambi2(
              color: textColor,
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
      onPressed: (){
        function();
      },
    );
  }
}
