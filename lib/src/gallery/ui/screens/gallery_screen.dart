
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/core/widgets/custom_image.dart';
import 'package:promina_task/core/widgets/custom_loading.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import 'package:promina_task/core/widgets/empty_screen.dart';
import 'package:promina_task/src/gallery/logic/gallery_cubit.dart';

import '../../../../core/utils/color_manger.dart';
import '../widgets/gallery_shimmer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            size: 24,
            text: 'My Gallery',
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<GalleryCubit, GalleryState>(
          builder: (context, state) {
            return state is GetGalleryLoadingState
            ? const GalleryShimmer()
            : context.read<GalleryCubit>().images.isEmpty
                ? const EmptyScreen(text: 'Your gallery is empty')
                : GridView.count(
                crossAxisCount: 2,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              children: List.generate(
                context.read<GalleryCubit>().images.length,
                      (index) => InkWell(
                          onTap: (){
                            context.pushNamed(Routes.imageDetailsScreen, arguments: context.read<GalleryCubit>().images[index]);
                          },
                          child: CustomImage(image: context.read<GalleryCubit>().images[index])),
              ),
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainBlue,
          child: Icon(Icons.upload, color: Colors.white, size: 30.r,),
          onPressed: (){
            context.pushNamed(Routes.uploadImageRoute, arguments: context);
          },
        ),
      ),
    );
  }
}
