import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/api/api_service.dart';
import 'package:doctors_app/core/api/end_points.dart';
import 'package:doctors_app/core/errors/exception.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/appointment/data/models/book_appointment_request_model.dart';
import 'package:doctors_app/features/appointment/data/models/my_appointment_response_model.dart';
import 'package:doctors_app/features/appointment/data/repos/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final ApiServices apiServices;
  AppointmentRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, Unit>> bookAppointment(
    BookAppointmentRequestModel bookAppointmentRequestModel,
  ) async {
    try {
      await apiServices.post(
        EndPoint.storeAppointment,
        data: bookAppointmentRequestModel.toJson(),
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, List<MyAppointmentResponseModel>>>
      getAllMyAppointments() async {
    try {
      final response = await apiServices.get(EndPoint.getAllAppointment);
      List<MyAppointmentResponseModel> myAppointmentList = response['data']
          .map<MyAppointmentResponseModel>((e) => MyAppointmentResponseModel.fromJson(e))
          .toList();

      return Right(myAppointmentList);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.message ?? ''));
    }
  }
}
