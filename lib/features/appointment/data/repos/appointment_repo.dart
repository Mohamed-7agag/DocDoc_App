import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/errors/failure.dart';
import 'package:doctors_app/features/appointment/data/models/my_appointment_response_model.dart';

import '../models/book_appointment_request_model.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, Unit>> bookAppointment(
    BookAppointmentRequestModel bookAppointmentRequestModel,
  );
  Future<Either<Failure,List<MyAppointmentResponseModel>>> getAllMyAppointments();
}
