import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/errors/failure.dart';

import '../models/book_appointment_request_model.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, Unit>> bookAppointment(
    BookAppointmentRequestModel bookAppointmentRequestModel,
  );
}
