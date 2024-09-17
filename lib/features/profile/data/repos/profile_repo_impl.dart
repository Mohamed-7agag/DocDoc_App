import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/end_points.dart';
import 'package:doctors_app/core/errors/exception.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/profile/data/model/profile_response_model.dart';
import 'package:doctors_app/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiServices apiServices;
  @override
  const ProfileRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, ProfileResponseModel>> getProfileData() async {
    try {
      final response = await apiServices.get(EndPoint.profile);
      return right(ProfileResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.message ?? ''));
    }
  }
}
