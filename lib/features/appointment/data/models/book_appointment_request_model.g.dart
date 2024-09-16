// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentRequestModel _$BookAppointmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentRequestModel(
      doctorId: json['doctor_id'] as String,
      startTime: json['start_time'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$BookAppointmentRequestModelToJson(
        BookAppointmentRequestModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'start_time': instance.startTime,
      'notes': instance.notes,
    };
