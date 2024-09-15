import 'package:doctors_app/features/appointment/data/models/appointment_type_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentState());

  void setDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void setTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  void setType(String type) {
    emit(state.copyWith(selectedType: type));
  }

  void setPaymentType(AppointmentRadioItemModel appointmentRadioItemModel) {
    emit(state.copyWith(selectedPaymentType: appointmentRadioItemModel));
  }
}

class BookAppointmentState {
  final DateTime? selectedDate;
  final String? selectedTime;
  final String? selectedType;
  final AppointmentRadioItemModel? selectedPaymentType;

  BookAppointmentState({
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

  BookAppointmentState copyWith({
    DateTime? selectedDate,
    String? selectedTime,
    String? selectedType,
    AppointmentRadioItemModel? selectedPaymentType,
  }) {
    return BookAppointmentState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedType: selectedType ?? this.selectedType,
      selectedPaymentType: selectedPaymentType ?? this.selectedPaymentType,
    );
  }
}
