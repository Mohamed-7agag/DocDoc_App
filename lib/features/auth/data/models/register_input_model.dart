import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_input_model.g.dart';

@JsonSerializable()
class RegisterInputModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  const RegisterInputModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterInputModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterInputModelToJson(this);

  @override
  List<Object?> get props => [email, password];
}
