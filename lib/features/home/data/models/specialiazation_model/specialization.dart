import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'specialization.g.dart';

@JsonSerializable()
class Specialization extends Equatable {
  final int? id;
  final String? name;

  const Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationToJson(this);

  @override
  List<Object?> get props => [id, name];
}
