import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'governrate.g.dart';

@JsonSerializable()
class Governrate extends Equatable {
  final int? id;
  final String? name;

  const Governrate({this.id, this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);

  Map<String, dynamic> toJson() => _$GovernrateToJson(this);

  @override
  List<Object?> get props => [id, name];
}
