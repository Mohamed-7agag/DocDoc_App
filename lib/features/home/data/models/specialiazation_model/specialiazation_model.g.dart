// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialiazation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialiazationModel _$SpecialiazationModelFromJson(
        Map<String, dynamic> json) =>
    SpecialiazationModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpecialiazationModelToJson(
        SpecialiazationModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };
