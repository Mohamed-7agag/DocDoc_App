import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'doctor.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final int? id;
  final String? name;
  final List<Doctor>? doctors;

  const Datum({this.id, this.name, this.doctors});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  List<Object?> get props => [id, name, doctors];
}
