import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'datum.dart';

part 'specialiazation_model.g.dart';

@JsonSerializable()
class SpecialiazationModel extends Equatable {
  final String? message;
  final List<Datum>? data;
  final bool? status;
  final int? code;

  const SpecialiazationModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory SpecialiazationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialiazationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialiazationModelToJson(this);

  @override
  List<Object?> get props => [message, data, status, code];
}
