
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:promina_task/src/gallery/data/repos/gallery_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final GalleryRepo _galleryRepo;

  GalleryCubit(this._galleryRepo) : super(GalleryInitial()){
    getGallery();
  }


  List<String> images= [];
  Future<void> getGallery()async {
    emit(GetGalleryLoadingState());

    final response = await _galleryRepo.getGallery(await getToken()??'');

    response.when(success: (userData)async {
      images= userData.galleryData.images;
      emit(GetGallerySuccessState());
    }, failure: (error) {
      emit(GetGalleryErrorState(error.message??''));
    });
  }

  Future<String?> getToken()async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

}
