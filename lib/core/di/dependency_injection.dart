import 'package:dio/dio.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/dio_factory.dart';
import 'package:doctors_app/features/appointment/data/repos/appointment_repo.dart';
import 'package:doctors_app/features/appointment/data/repos/appointment_repo_impl.dart';
import 'package:doctors_app/features/auth/data/repos/auth_repo.dart';
import 'package:doctors_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:doctors_app/features/home/data/repos/specialization_repo.dart';
import 'package:doctors_app/features/home/data/repos/specialization_repo_impl.dart';
import 'package:doctors_app/features/profile/data/repos/profile_repo.dart';
import 'package:doctors_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:doctors_app/features/search/data/repos/search_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  // auth repos
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiServices: getIt()),
  );

  // specialization repo
  getIt.registerLazySingleton<SpecializationRepo>(
    () => SpecializationRepoImpl(apiServices: getIt()),
  );

  // Appointment repo
  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(apiServices: getIt()),
  );
  // search repo
  getIt.registerLazySingleton(
    () => SearchRepo(apiServices: getIt()),
  );
  // profile repo
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(apiServices: getIt()),
  );
}
