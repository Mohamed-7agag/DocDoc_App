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
        if (_specializationDataList.isNotEmpty) {
          getDoctorsList(_specializationDataList.first.id ?? 1);
        }
        emit(SpecializationSuccess(specializationModel: specializationModel));
      },
    );
  }

  /// Fetches the list of doctors for a given [specializationId]
  void getDoctorsList(int specializationId) {
    try {
      final doctorList = _specializationDataList
              .firstWhere((e) => e.id == specializationId)
              .doctors ??
          [];
      if (doctorList.isNullOrEmpty()) {
        emit(const DoctorsListFailure(errMessage: 'No Doctors Found'));
      } else {
        emit(DoctorsListSuccess(doctorsList: doctorList));
      }
    } catch (e) {
      emit(
        const DoctorsListFailure(errMessage: 'Failed to fetch doctors list'),
      );
    }
  }

  @override
  void onChange(Change<SpecializationState> change) {
    super.onChange(change);
    print(
        'SpecializationCubit - ${change.currentState.runtimeType}: ${change.nextState.runtimeType}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('SpecializationCubit - Error: $error');
  }
}
