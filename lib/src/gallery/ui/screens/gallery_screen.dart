
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/helpers/spacing.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/core/utils/app_constants.dart';
import 'package:promina_task/core/utils/font_weight_helper.dart';
import 'package:promina_task/core/widgets/custom_image.dart';
import 'package:promina_task/core/widgets/custom_loading.dart';
import 'package:promina_task/core/widgets/custom_text.dart';
import 'package:promina_task/core/widgets/empty_screen.dart';
import 'package:promina_task/src/gallery/logic/gallery_cubit.dart';
import 'package:promina_task/src/upload_image/logic/upload_image_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../upload_image/ui/upload_image_dialog.dart';
import '../widgets/gallery_shimmer.dart';
import '../widgets/home_button.dart';
import '../widgets/logout_dialog.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        body: Stack(
          children: [

            Image.asset(
              AppAssets.background,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,),


            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8,
                  sigmaY: 8,
                ),
                child: Column(
                  children: [

                    verticalSpace(20),

                    Padding(
                      padding: EdgeInsets.only(left: 27.0.w, right: 32.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              verticalSpace(70),
                              BlocBuilder<GalleryCubit, GalleryState>(
                                builder: (context, state) {
                                  return context.read<GalleryCubit>().loadWhileGetName
                                      ? const CustomLoading()
                                      : CustomText(
                                      text: 'Welcome\n${context.read<GalleryCubit>().name}',
                                      size: 32,
                                    fontWeight: FontWeightHelper.semiBold,
                                    color: AppColors.blackColor,
                                  );
                                }
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 44.r,
                            backgroundImage: const AssetImage(AppAssets.profile),
                          )
                        ],
                      ),
                    ),

                    verticalSpace(37),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeButton(
                          text: 'log out',
                          iconPath: AppAssets.arrowLeft,
                          function: (){
                            logoutDialog(
                                function: ()async {
                              SharedPreferences sharedPref= await SharedPreferences.getInstance();
                              await sharedPref.clear();
                              context.pushNamedAndRemoveUntil(Routes.loginRoute, predicate: (p)=> false);
                            },context: context);
                          },
                        ),

                        HomeButton(
                          text: 'upload',
                          iconPath: AppAssets.arrowTop,
                          function: (){
                            showUploadImageDialog(
                              context: context,
                              galleryFunction: (){
                                context.read<UploadImageCubit>().pickImage(context: context, imageSource: ImageSource.gallery);
                              },
                              cameraFunction: (){
                                context.read<UploadImageCubit>().pickImage(context: context, imageSource: ImageSource.camera);
                              }
                            );
                          },
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Expanded(
                      child: BlocBuilder<GalleryCubit, GalleryState>(
                        builder: (context, state) {
                          return state is GetGalleryLoadingState
                          ? const GalleryShimmer()
                          : context.read<GalleryCubit>().images.isEmpty
                              ? const EmptyScreen(text: 'Your gallery is empty')
                              : GridView.count(
                              crossAxisCount: 3,
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 28.w),
                            crossAxisSpacing: 24.w,
                            mainAxisSpacing: 26.h,
                            children: List.generate(
                              context.read<GalleryCubit>().images.length,
                                    (index) => Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.25),
                                              offset: const Offset(0, 4),
                                              blurRadius: 8.w
                                            )
                                          ]
                                        ),
                                        child: CustomImage(image: context.read<GalleryCubit>().images[index])),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
