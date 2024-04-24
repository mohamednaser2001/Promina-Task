part of 'upload_image_cubit.dart';

@immutable
abstract class UploadImageState {}

class GalleryInitial extends UploadImageState {}
class GetImageState extends UploadImageState {}


class UploadToGalleryLoadingState extends UploadImageState {}
class UploadToGallerySuccessState extends UploadImageState {}
class UploadToGalleryErrorState extends UploadImageState {
  String error;
  UploadToGalleryErrorState(this.error);
}
