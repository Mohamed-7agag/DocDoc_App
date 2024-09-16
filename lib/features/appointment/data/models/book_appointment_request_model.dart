import 'package:json_annotation/json_annotation.dart';
part 'book_appointment_request_model.g.dart';
@JsonSerializable()
class BookAppointmentRequestModel {
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'start_time')
  final String startTime;
  final String notes;

  BookAppointmentRequestModel({
    required this.doctorId,
    required this.startTime,
    required this.notes,
  });

  factory BookAppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentRequestModelToJson(this);
}
