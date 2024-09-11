import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'specialization_model.g.dart';

@JsonSerializable()
class SpecializationModel extends Equatable {
  final String? message;
  final List<Datum>? data;
  final bool? status;
  final int? code;

  const SpecializationModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationModelToJson(this);

  @override
  List<Object?> get props => [message, data, status, code];
}
