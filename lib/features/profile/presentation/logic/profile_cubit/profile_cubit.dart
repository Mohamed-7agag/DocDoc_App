import 'package:doctors_app/features/profile/data/model/profile_response_model.dart';
import 'package:doctors_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    final result = await profileRepo.getProfileData();
    result.fold(
      (failure) => emit(ProfileFailure(errMessage: failure.errMessage)),
      (profileData) => emit(ProfileSuccess(profileResponseModel: profileData)),
    );
  }
}
