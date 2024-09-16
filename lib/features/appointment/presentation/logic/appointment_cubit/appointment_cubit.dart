import 'package:doctors_app/features/appointment/data/repos/appointment_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_appointment_request_model.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this.appointmentRepo) : super(AppointmentInitial());
  final AppointmentRepo appointmentRepo;

  Future<void> bookAppointment({
    required String doctorId,
    required String startTime,
    required String notes,
  }) async {
    emit(AppointmentLoading());
    final result = await appointmentRepo.bookAppointment(
      BookAppointmentRequestModel(
        doctorId: doctorId,
        startTime: startTime,
        notes: notes,
      ),
    );
    result.fold(
      (failure) => emit(AppointmentFailure(errMessage: failure.errMessage)),
      (success) => emit(
        const AppointmentSuccess(message: 'Appointment booked successfully'),
      ),
    );
  }
}
