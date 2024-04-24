


import 'package:json_annotation/json_annotation.dart';
part 'gallery_response_model.g.dart';

@JsonSerializable()
class GalleryResponse {
  String status;
  String message;
  @JsonKey(name: 'data')
  GalleryDataModel galleryData;

  GalleryResponse({
    required this.message,
    required this.status,
    required this.galleryData,
  });

  factory GalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$GalleryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryResponseToJson(this);
}

@JsonSerializable()
class GalleryDataModel {
  @JsonKey(name: 'images')
  List<String> images;

  GalleryDataModel({
    required this.images,
  });

  factory GalleryDataModel.fromJson(Map<String, dynamic> json) => _$GalleryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryDataModelToJson(this);
}