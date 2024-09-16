import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'city.dart';
import 'specialization.dart';

part 'doctor.g.dart';

@JsonSerializable()
class DoctorModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;
  final Specialization? specialization;
  final City? city;
  @JsonKey(name: 'appoint_price')
  final int? appointPrice;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;

  const DoctorModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        photo,
        gender,
        address,
        description,
        degree,
        specialization,
        city,
        appointPrice,
        startTime,
        endTime,
      ];
}
