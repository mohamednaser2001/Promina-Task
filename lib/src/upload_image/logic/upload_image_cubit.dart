import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:promina_task/src/gallery/data/repos/gallery_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../gallery/logic/gallery_cubit.dart';
import '../data/repos/upload_image_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepo _uploadImageRepo;

  UploadImageCubit(this._uploadImageRepo) : super(GalleryInitial()){}


  Future<String?> getToken()async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }




  Future<void> uploadImageToGallery(BuildContext context)async{
    emit(UploadToGalleryLoadingState());

    var formData = FormData.fromMap({
      'img': [MultipartFile.fromFileSync(pickedImage!.path, filename: pickedImage!.path)],
    });

    final response = await _uploadImageRepo.uploadImage(await getToken()??'', formData);

    response.when(success: (userData)async {

      pickedImage= null;
      await context.read<GalleryCubit>().getGallery();
      emit(UploadToGallerySuccessState());
    }, failure: (error) {
      emit(UploadToGalleryErrorState(error.message??''));
    });
  }


  /// Pick image from gallery.
  File? pickedImage;
  var picker = ImagePicker();

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      emit(GetImageState());
    }
  }
}
