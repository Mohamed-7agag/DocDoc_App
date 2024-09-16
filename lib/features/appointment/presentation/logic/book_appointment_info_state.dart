import 'package:doctors_app/features/appointment/data/models/appointment_type_item_model.dart';

class BookAppointmentInfoState {
  final DateTime? selectedDate;
  final String? selectedTime;
  final String? selectedType;
  final AppointmentRadioItemModel? selectedPaymentType;

  BookAppointmentInfoState({
    DateTime? selectedDate,
    String? selectedTime,
    String? selectedType,
    AppointmentRadioItemModel? selectedPaymentType,
  })  : selectedDate =
            selectedDate ?? DateTime.now().add(const Duration(days: 1)),
        selectedTime = selectedTime ?? '10:00 AM',
        selectedType = selectedType ?? 'In Person',
        selectedPaymentType = selectedPaymentType ??
            const AppointmentRadioItemModel(
              title: 'Paypal',
              image: 'assets/images/paypal.svg',
            );

  BookAppointmentInfoState copyWith({
    DateTime? selectedDate,
    String? selectedTime,
    String? selectedType,
    AppointmentRadioItemModel? selectedPaymentType,
  }) {
    return BookAppointmentInfoState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedType: selectedType ?? this.selectedType,
      selectedPaymentType: selectedPaymentType ?? this.selectedPaymentType,
    );
  }
}
