
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:promina_task/src/gallery/data/repos/gallery_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final GalleryRepo _galleryRepo;

  GalleryCubit(this._galleryRepo) : super(GalleryInitial()){
    getDataAndGallery();
  }

  late String? token;
  late String? name;

  bool loadWhileGetName= false;
  Future<void> getDataAndGallery()async {
    loadWhileGetName= true;
    emit(GetNameLoadingState());
    await getLocalData();
    await getGallery();
  }

  List<String> images= [];
  Future<void> getGallery()async {
    emit(GetGalleryLoadingState());

    final response = await _galleryRepo.getGallery(token??'');

    response.when(success: (userData)async {
      images= userData.galleryData.images;
      emit(GetGallerySuccessState());
    }, failure: (error) {
      emit(GetGalleryErrorState(error.message??''));
    });
  }

  Future<void> getLocalData()async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    token= sharedPreferences.getString('token');
    name= sharedPreferences.getString('name');
    loadWhileGetName= false;
    emit(GetNameSuccessState());
  }

}
