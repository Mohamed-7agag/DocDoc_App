import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends Equatable {
  final String message;
  final UserData data;
  final bool status;
  final int code;

  const RegisterResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);

  @override
  List<Object?> get props => [message, data, status, code];
}

@JsonSerializable()
class UserData extends Equatable {
  final String? token;
  @JsonKey(name: 'username')
  final String? userName;

  const UserData({required this.token, required this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props => [token, userName];
}
