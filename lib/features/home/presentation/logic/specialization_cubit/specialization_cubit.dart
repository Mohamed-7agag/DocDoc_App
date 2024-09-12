import 'package:doctors_app/core/helpers/extensions.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/datum.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/home/data/models/specialiazation_model/specialization_model.dart';
import 'package:doctors_app/features/home/data/repos/specialization_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'specialization_state.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  SpecializationCubit(this._specializationRepo)
      : super(SpecializationInitial());

  final SpecializationRepo _specializationRepo;
  List<Datum> _specializationDataList = [];

  Future<void> getSpecializationList() async {
    emit(SpecializationLoading());
    final result = await _specializationRepo.getSpecializationList();
    result.fold(
      (failure) => emit(SpecializationFailure(errMessage: failure.errMessage)),
      (specializationModel) {
        _specializationDataList = specializationModel.data ?? [];
        getRecommendedDoctorsList();
        emit(SpecializationSuccess(specializationModel: specializationModel));
      },
    );
  }

  /// Fetches the list of recommended doctors
  void getRecommendedDoctorsList() {
    try {
      final recommendedDoctorList = _specializationDataList
          .map((specialization) => specialization.doctors?.first)
          .toList();
      if (recommendedDoctorList.isNullOrEmpty()) {
        emit(const DoctorsListFailure(errMessage: 'No Doctors Found'));
      } else {
        emit(DoctorsListSuccess(recommendedDoctorList: recommendedDoctorList));
      }
    } catch (e) {
      emit(
        const DoctorsListFailure(errMessage: 'Failed to fetch doctors list'),
      );
    }
  }
}
