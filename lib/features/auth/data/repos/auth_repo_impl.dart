import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/end_points.dart';
import 'package:doctors_app/core/errors/exception.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/auth/data/models/login_request_model.dart';
import 'package:doctors_app/features/auth/data/models/login_response_model.dart';
import 'package:doctors_app/features/auth/data/models/register_request_model.dart';
import 'package:doctors_app/features/auth/data/models/register_response_model.dart';
import 'package:doctors_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await apiServices.post(EndPoint.login,
          data: loginRequestModel.toJson());
      return Right(LoginResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error!'));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response = await apiServices.post(EndPoint.register,
          data: registerRequestModel.toJson());
      return Right(RegisterResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error!'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await apiServices.post(EndPoint.logout);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message));
    } catch (e) {
      return Left(Failure(errMessage: 'Unexpected error!'));
    }
  }
}
