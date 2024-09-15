import 'package:flutter_bloc/flutter_bloc.dart';

class DateAndTimeCubit extends Cubit<DateAndTimeState> {
  DateAndTimeCubit() : super(DateAndTimeState());

  void setDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void setTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  void setType(String type) {
    emit(state.copyWith(selectedType: type));
  }
}

class DateAndTimeState {
  final DateTime? selectedDate;
  final String? selectedTime;
  final String? selectedType;

   DateAndTimeState({
    DateTime? selectedDate,
    String? selectedTime,
    String? selectedType,
  })  : selectedDate = selectedDate ?? DateTime.now().add(const Duration(days: 1)),
        selectedTime = selectedTime ?? '10:00 AM',
        selectedType = selectedType ?? 'In Person';

  DateAndTimeState copyWith({
    DateTime? selectedDate,
    String? selectedTime,
    String? selectedType,
  }) {
    return DateAndTimeState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedType: selectedType ?? this.selectedType,
    );
  }
}
