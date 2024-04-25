


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/widgets/custom_shimmer.dart';



class GalleryShimmer extends StatelessWidget {
  const GalleryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 24.h,
      childAspectRatio: 1/0.8,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      children: List.generate(12,
              (index) {
            return const CardShimmer();
          }
      ),
    );
  }
}


class CardShimmer extends StatelessWidget {
  const CardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: const CustomShimmer(
        width: double.infinity,
        height: double.infinity,
        radius: 12,
      ),
    );
  }
}