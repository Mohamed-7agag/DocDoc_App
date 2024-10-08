import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/auth/data/models/login_request_model.dart';
import 'package:doctors_app/features/auth/data/models/login_response_model.dart';
import 'package:doctors_app/features/auth/data/models/register_request_model.dart';
import 'package:doctors_app/features/auth/data/models/register_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel loginRequestModel);
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel registerRequestModel);
  Future<Either<Failure, Unit>> logOut();
}
