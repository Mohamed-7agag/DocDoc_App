import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int? code;
  final String? message;

  const ErrorModel({required this.code, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json["message"] as String?,
      code: json["code"] as int?,
    );
  }

  @override
  List<Object?> get props => [message, code];
}
