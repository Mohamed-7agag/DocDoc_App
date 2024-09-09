import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_input_model.g.dart';

@JsonSerializable()
class LoginInputModel extends Equatable{
  final String email;
  final String password;

  const LoginInputModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginInputModelToJson(this);

  @override
  List<Object?> get props => [email, password];
}