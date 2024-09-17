import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  String? message;
  List<ProfileDataModel>? data;
  bool? status;
  int? code;

  ProfileResponseModel({this.message, this.data, this.status, this.code});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class ProfileDataModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  ProfileDataModel({this.id, this.name, this.email, this.phone, this.gender});

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}

