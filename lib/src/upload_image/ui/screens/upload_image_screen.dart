import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/helpers/extensions.dart';
import 'package:promina_task/core/utils/color_manger.dart';
import 'package:promina_task/core/widgets/snack_bar.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../logic/upload_image_cubit.dart';

class UploadImageScreen extends StatelessWidget {

  const UploadImageScreen({super.key, required this.homeContext});
  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const CustomText(
            size: 24,
            text: 'Upload Image',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          children: [
            
            InkWell(
              onTap: (){
                context.read<UploadImageCubit>().pickImage();
              },
              child: Container(
                height: 211.h,
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(vertical: 30.h, ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.all(Radius.circular(17.r)),
                  border: Border.all(color: AppColors.mainBlue,),
                ),

                child:  BlocBuilder<UploadImageCubit, UploadImageState>(
                    builder: (context, state) {
                      return context.read<UploadImageCubit>().pickedImage!= null
                          ? ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(17.r)),
                          child: Image.file(context.read<UploadImageCubit>().pickedImage!, fit: BoxFit.cover, width: double.infinity,))
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file_outlined, size: 35.r, color: Colors.white,),
                          verticalSpace(12.h),
                          const CustomText(
                            text: 'Upload a pic',
                            color: Colors.white,
                            size: 16, fontWeight: FontWeight.w500,),
                        ],
                      );
                    }
                ),

              ),
            ),


            verticalSpace(100),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: BlocConsumer<UploadImageCubit, UploadImageState>(

                builder: (context, state) {
                  return state is UploadToGalleryLoadingState
                      ? const CustomLoading()
                      : CustomButton(text: 'Upload',
                      function: (){
                          if(context.read<UploadImageCubit>().pickedImage!= null){
                            context.read<UploadImageCubit>().uploadImageToGallery(homeContext);
                          }else {
                            CustomSnackBarHandler.showCustomSnackBar(context: context, text: 'Please, select image first');
                          }
                      });
                },

                listener: (context, state){
                  if(state is UploadToGalleryErrorState){
                    CustomSnackBarHandler.showCustomSnackBar(context: context, text: 'Error, please try again');
                  }else if(state is UploadToGallerySuccessState){
                    CustomSnackBarHandler.showCustomSnackBar(context: context,state: SnackBarStates.success, text: 'Image uploaded to gallery successfully');
                  }
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
