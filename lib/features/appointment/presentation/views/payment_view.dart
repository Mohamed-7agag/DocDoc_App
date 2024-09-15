import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:flutter/material.dart';

import '../widgets/payment_options_section.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Option', style: AppStyle.styleSemiBold16),
        verticalSpace(24),
        const PaymentOptionsSection()
      ],
    );
  }
}
