import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/profile/data/model/profile_response_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileResponseModel>> getProfileData();
}