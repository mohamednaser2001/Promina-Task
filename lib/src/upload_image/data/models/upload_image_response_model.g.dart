// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponseModel _$UploadImageResponseModelFromJson(
        Map<String, dynamic> json) =>
    UploadImageResponseModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UploadImageResponseModelToJson(
        UploadImageResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
