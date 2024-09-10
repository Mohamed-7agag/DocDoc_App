import 'package:dio/dio.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/dio_factory.dart';
import 'package:doctors_app/features/auth/data/repos/auth_repo.dart';
import 'package:doctors_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  // auth repos
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(apiServices: getIt()));
}
