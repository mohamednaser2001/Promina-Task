// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryResponse _$GalleryResponseFromJson(Map<String, dynamic> json) =>
    GalleryResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      galleryData:
          GalleryDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GalleryResponseToJson(GalleryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.galleryData,
    };

GalleryDataModel _$GalleryDataModelFromJson(Map<String, dynamic> json) =>
    GalleryDataModel(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GalleryDataModelToJson(GalleryDataModel instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
