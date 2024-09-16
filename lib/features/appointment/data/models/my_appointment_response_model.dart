class MyAppointmentResponseModel {
  final String doctorName;
  final String degree;
  final String specializationName;
  final String appointmentTime;
  final String notes;

  MyAppointmentResponseModel({
    required this.doctorName,
    required this.degree,
    required this.specializationName,
    required this.appointmentTime,
    required this.notes,
  });

  factory MyAppointmentResponseModel.fromJson(Map<String, dynamic> json) {
    return MyAppointmentResponseModel(
      doctorName: json['doctor']['name'],
      degree: json['doctor']['degree'],
      specializationName: json['doctor']['specialization']['name'],
      appointmentTime: json['appointment_time'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorName': doctorName,
      'degree': degree,
      'specializationName': specializationName,
      'appointmentTime': appointmentTime,
    };
  }
}
