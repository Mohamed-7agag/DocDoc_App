part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileResponseModel profileResponseModel;
  const ProfileSuccess({required this.profileResponseModel});
  @override
  List<Object> get props => [profileResponseModel];
}
final class ProfileFailure extends ProfileState {
  final String errMessage;
  const ProfileFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
final class ProfileLoading extends ProfileState {}
