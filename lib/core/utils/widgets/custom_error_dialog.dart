import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future customErrorDialog(BuildContext context, String errMessage) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.topSlide,
    body: Text(errMessage),
    btnOkOnPress: () {},
    btnCancelOnPress: () {},
  ).show();
}
