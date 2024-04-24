
import 'package:dio/dio.dart';
import 'package:promina_task/core/network/api_constants.dart';
import 'package:retrofit/http.dart';
import '../../src/gallery/data/models/gallery_response_model.dart';
import '../../src/login/data/models/login_request_model.dart';
import '../../src/login/data/models/user_model.dart';
import '../../src/upload_image/data/models/upload_image_response_model.dart';
part 'api_service.g.dart';



@RestApi(baseUrl: ApiConstants.baseUrl) // retrofit
abstract class ApiService{

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  // Login
  @POST(ApiConstants.loginEndPoint) //retrofit annotations
  Future<UserDataModel> login(@Body() LoginRequestModel loginRequestModel,);


  @GET(ApiConstants.myGalleryEndPoint)
  Future<GalleryResponse> getGallery(@Header('Authorization') String token);



  @POST(ApiConstants.uploadImageEndPoint)
  @MultiPart()
  Future<UploadImageResponseModel> uploadImage(
      @Header('Authorization') String token,
      @Body() FormData formData,
      );
}