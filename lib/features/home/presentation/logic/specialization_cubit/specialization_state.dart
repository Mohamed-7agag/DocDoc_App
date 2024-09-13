part of 'specialization_cubit.dart';

sealed class SpecializationState extends Equatable {
  const SpecializationState();

  @override
  List<Object> get props => [];
}

final class SpecializationInitial extends SpecializationState {}

final class SpecializationSuccess extends SpecializationState {
  final SpecializationModel specializationModel;

  const SpecializationSuccess({required this.specializationModel});
}

final class SpecializationFailure extends SpecializationState {
  final String errMessage;

  const SpecializationFailure({required this.errMessage});
}

final class SpecializationLoading extends SpecializationState {}

//! for doctors list
final class DoctorsListSuccess extends SpecializationState {
  final List<DoctorModel?> recommendedDoctorList;
  const DoctorsListSuccess({required this.recommendedDoctorList});
}

final class DoctorsListFailure extends SpecializationState {
  final String errMessage;
  const DoctorsListFailure({required this.errMessage});
}
