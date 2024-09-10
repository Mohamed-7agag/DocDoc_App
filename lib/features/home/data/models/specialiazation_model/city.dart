import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'governrate.dart';

part 'city.g.dart';

@JsonSerializable()
class City extends Equatable {
  final int? id;
  final String? name;
  final Governrate? governrate;

  const City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object?> get props => [id, name, governrate];
}
