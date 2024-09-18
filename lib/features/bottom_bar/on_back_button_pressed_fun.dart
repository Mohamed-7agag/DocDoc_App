  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> onbackButtonPressed(BuildContext context) async {
    bool? exitApp = await AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      animType: AnimType.rightSlide,
      title: 'Really?',
      desc: 'Do you want to exit?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
      btnOkText: 'Yes',
      btnCancelText: 'No',
    ).show();

    return exitApp ?? false;
  }