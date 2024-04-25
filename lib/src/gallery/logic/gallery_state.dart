part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}
class GetImageState extends GalleryState {}

class GetGalleryLoadingState extends GalleryState {}
class GetGallerySuccessState extends GalleryState {}
class GetGalleryErrorState extends GalleryState {
  String error;
  GetGalleryErrorState(this.error);
}

class UploadToGalleryLoadingState extends GalleryState {}
class UploadToGallerySuccessState extends GalleryState {}
class UploadToGalleryErrorState extends GalleryState {
  String error;
  UploadToGalleryErrorState(this.error);
}

class GetNameLoadingState extends GalleryState {}
class GetNameSuccessState extends GalleryState {}