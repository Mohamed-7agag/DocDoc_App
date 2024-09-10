import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'city.dart';
import 'specialization.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor extends Equatable {
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

  const Doctor({
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

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);

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
