import 'package:doctors_app/core/api/dio_factory.dart';
import 'package:doctors_app/core/cache/cache_helper.dart';
import 'package:doctors_app/core/utils/app_constants.dart';
import 'package:doctors_app/features/auth/data/models/login_request_model.dart';
import 'package:doctors_app/features/auth/data/models/login_response_model.dart';
import 'package:doctors_app/features/auth/data/models/register_request_model.dart';
import 'package:doctors_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(AuthLoginLoading());
      final loginReqestModel = LoginRequestModel(
          email: emailController.text, password: passwordController.text);
      final result = await authRepo.login(loginReqestModel);
      result.fold((failure) {
        emit(AuthLoginFailure(errMessage: failure.errMessage));
      }, (loginResponseModel) async {
        await saveUserToken(loginResponseModel);
        emit(AuthLoginSuccess());
      });
    }
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(AuthRegisterLoading());
      final registerReqestModel = RegisterRequestModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        gender: "0",
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text,
      );
      final result = await authRepo.register(registerReqestModel);
      result.fold((failure) {
        emit(AuthRegisterFailure(errMessage: failure.errMessage));
      }, (registerResponseModel) {
        emit(AuthRegisterSuccess());
      });
    }
  }

  Future<void> logOut() async {
    await authRepo.logOut();
  }

  Future<void> saveUserToken(LoginResponseModel loginResponseModel) async {
    await CacheHelper.setSecuredString(
        AppConstants.userToken, loginResponseModel.data.token!);
    DioFactory.setTokenIntoHeaderAfterLogin(loginResponseModel.data.token!);
  }
}
