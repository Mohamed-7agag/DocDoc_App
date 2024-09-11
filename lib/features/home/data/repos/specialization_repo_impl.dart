import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/end_points.dart';
import 'package:doctors_app/core/errors/exception.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/specialization_model.dart';
import 'package:doctors_app/features/home/data/repos/specialization_repo.dart';

class SpecializationRepoImpl implements SpecializationRepo {
  final ApiServices apiServices;

  SpecializationRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, SpecializationModel>> getSpecializationList() async {
    try {
      final response = await apiServices.get(EndPoint.specialization);
      return Right(SpecializationModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message ?? ''));
    }
  }
}
