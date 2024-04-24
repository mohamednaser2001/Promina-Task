import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_text.dart';

class ImageDetailsScreen extends StatelessWidget {

  const ImageDetailsScreen({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const CustomText(
            size: 24,
            text: 'Image',
            fontWeight: FontWeight.w600,
          ),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 32.r,
              )),
          titleSpacing: 0,
        ),
        body: Center(child: CustomImage(image: image, defaultImageFit: BoxFit.contain, radius: 0,))
    );
  }
}
