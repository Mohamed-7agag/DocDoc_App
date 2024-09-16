part of 'appointment_cubit.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentSuccess extends AppointmentState {
  final String message;

  const AppointmentSuccess({required this.message});
}

final class AppointmentFailure extends AppointmentState {
  final String errMessage;

  const AppointmentFailure({required this.errMessage});
}

final class AppointmentLoading extends AppointmentState {}
