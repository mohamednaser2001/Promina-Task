

import 'package:promina_task/src/login/data/models/user_model.dart';
import '../../../../core/network/api_error_model.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../models/login_request_model.dart';

class LoginRepo{

  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<UserDataModel>> login(LoginRequestModel loginRequestModel)async {

    try{
      final response= await _apiService.login(loginRequestModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ApiErrorModel(message: 'Error, please try again'));
    }
  }
}