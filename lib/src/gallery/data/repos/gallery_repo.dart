

import 'package:promina_task/core/network/api_error_model.dart';
import 'package:promina_task/src/gallery/data/models/gallery_response_model.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';

class GalleryRepo{

  final ApiService _apiService;
  GalleryRepo(this._apiService);


  Future<ApiResult<GalleryResponse>> getGallery(String token)async {

    try{
      final response= await _apiService.getGallery('Bearer $token');
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ApiErrorModel(message: 'Error, please try again'));
    }
  }

}