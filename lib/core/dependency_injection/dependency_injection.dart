
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:promina_task/src/gallery/data/repos/gallery_repo.dart';
import '../../src/gallery/logic/gallery_cubit.dart';
import '../../src/login/data/repos/login_repo.dart';
import '../../src/login/logic/login_cubit.dart';
import '../../src/upload_image/data/repos/upload_image_repo.dart';
import '../../src/upload_image/logic/upload_image_cubit.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt()async {
  // Init Dio
  Dio dio= DioFactory.getDio();

  // Init Api Service
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));



  // Login cubit & Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Gallery cubit & Repo
  getIt.registerLazySingleton<GalleryRepo>(() => GalleryRepo(getIt()));
  getIt.registerFactory<GalleryCubit>(() => GalleryCubit(getIt()));

  // Upload Image cubit & Repo
  getIt.registerLazySingleton<UploadImageRepo>(() => UploadImageRepo(getIt()));
  getIt.registerFactory<UploadImageCubit>(() => UploadImageCubit(getIt()));


}
