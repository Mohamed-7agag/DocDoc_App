import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);

  @override
  List<Object?> get props => [email, password];
}
