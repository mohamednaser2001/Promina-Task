

import 'package:dio/dio.dart';
import 'package:promina_task/core/network/api_error_model.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../models/upload_image_response_model.dart';

class UploadImageRepo{

  final ApiService _apiService;
  UploadImageRepo(this._apiService);


  Future<ApiResult<UploadImageResponseModel>> uploadImage(String token, FormData body)async {

    try{
      final response= await _apiService.uploadImage('Bearer $token', body);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ApiErrorModel(message: 'Error, please try again'));
    }
  }
}