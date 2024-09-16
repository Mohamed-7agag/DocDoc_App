import 'package:doctors_app/features/appointment/data/models/appointment_type_item_model.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentInfoCubit extends Cubit<BookAppointmentInfoState> {
  BookAppointmentInfoCubit() : super(BookAppointmentInfoState());

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
