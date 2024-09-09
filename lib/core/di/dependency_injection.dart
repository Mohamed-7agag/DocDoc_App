import 'package:dio/dio.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  getIt.registerLazySingleton<Dio>((() => Dio()));
  getIt.registerLazySingleton<ApiServices>((() => ApiServices(getIt())));
}
