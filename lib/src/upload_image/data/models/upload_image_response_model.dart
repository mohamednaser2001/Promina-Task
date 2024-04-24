
import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response_model.g.dart';

@JsonSerializable()
class UploadImageResponseModel {
  final String? message;
  final String? status;

  UploadImageResponseModel({
    required this.message,
    this.status,
  });

  factory UploadImageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseModelFromJson(json);

  // Map<String, dynamic> toJson() => _$EditProfileModelToJson(this);
}