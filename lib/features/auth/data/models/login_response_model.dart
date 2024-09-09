import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final UserData data;
  final String status;
  final int code;

  LoginResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class UserData extends Equatable {
  final String? token;
  @JsonKey(name: 'username')
  final String? userName;

  const UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @override
  List<Object?> get props => [token, userName];
}
