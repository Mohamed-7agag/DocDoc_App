part of 'appointment_cubit.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {}

//! book appointment state
final class AppointmentSuccess extends AppointmentState {
  final String message;

  const AppointmentSuccess({required this.message});
}

final class AppointmentFailure extends AppointmentState {
  final String errMessage;

  const AppointmentFailure({required this.errMessage});
}

final class AppointmentLoading extends AppointmentState {}

//! get appointment state

final class GetMyAppointmentsSuccess extends AppointmentState {
  final List<MyAppointmentResponseModel> myAppointments;

  const GetMyAppointmentsSuccess({required this.myAppointments});
}

final class GetMyAppointmentsFailure extends AppointmentState {
  final String errMessage;
  const GetMyAppointmentsFailure({required this.errMessage});
}

final class GetMyAppointmentsLoading extends AppointmentState {}
