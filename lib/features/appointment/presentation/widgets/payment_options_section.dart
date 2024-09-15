import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/features/appointment/data/models/appointment_type_item_model.dart';
import 'package:doctors_app/features/appointment/presentation/logic/book_appointment_cubit.dart';
import 'package:doctors_app/features/appointment/presentation/widgets/appointment_radio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionsSection extends StatefulWidget {
  const PaymentOptionsSection({super.key});

  @override
  State<PaymentOptionsSection> createState() => _PaymentOptionsSectionState();
}

class _PaymentOptionsSectionState extends State<PaymentOptionsSection> {

final List<AppointmentRadioItemModel> paymentOptionsList = [
    const AppointmentRadioItemModel(
      title: 'Paypal',
      image: 'assets/images/paypal.svg',
    ),
    const AppointmentRadioItemModel(
      title: 'Master Card',
      image: 'assets/images/master_card.svg',
    ),
    const AppointmentRadioItemModel(
      title: 'American Express',
      image: 'assets/images/american_express.svg',
    ),
    const AppointmentRadioItemModel(
      title: 'Capital One',
      image: 'assets/images/capital_one.svg',
    ),
    const AppointmentRadioItemModel(
      title: 'Barclays',
      image: 'assets/images/barclays.svg',
    ),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: paymentOptionsList.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: AppColors.grey30);
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
            context
                .read<BookAppointmentCubit>()
                .setPaymentType(paymentOptionsList[index]);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: AppointmentRadioItem(
              appointmentTypeItemModel: paymentOptionsList[index],
              isSelected: selectedIndex == index,
            ),
          ),
        );
      },
    );
  }
}