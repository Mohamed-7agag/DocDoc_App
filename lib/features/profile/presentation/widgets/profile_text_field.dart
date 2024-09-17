import 'package:flutter/material.dart';

import 'package:doctors_app/core/theming/app_colors.dart';
import 'package:doctors_app/core/theming/app_style.dart';

class ProfileTextField extends StatefulWidget {
  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.value,
  });
  final String label;
  final TextEditingController controller;
  final String value;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  void initState() {
    widget.controller.text = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        label: Text(
          widget.label,
          style: AppStyle.styleSemiBold14.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        border: _buildBorder(AppColors.grey30),
        enabledBorder: _buildBorder(AppColors.grey30),
        focusedBorder: _buildBorder(AppColors.primaryColor),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
