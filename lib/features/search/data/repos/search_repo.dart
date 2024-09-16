import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/end_points.dart';
import 'package:doctors_app/core/errors/exception.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';

class SearchRepo {
  final ApiServices apiServices;
  const SearchRepo({required this.apiServices});

  Future<Either<Failure, List<DoctorModel>>> getSearchedList(
      {required String doctorName}) async {
    try {
      final response = await apiServices.get(EndPoint.search(doctorName));
      final List<DoctorModel> doctorList = response['data']
          .map<DoctorModel>((e) => DoctorModel.fromJson(e))
          .toList();
      return Right(doctorList);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message ?? ''));
    }
  }
}
