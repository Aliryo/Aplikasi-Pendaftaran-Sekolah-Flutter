import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetInputText extends StatelessWidget {
  const WidgetInputText({
    super.key,
    required this.title,
    required this.hintText,
    this.validator,
    this.controller,
    this.textInputAction,
    this.icon,
    this.textInputType,
    this.obscureText = false,
    this.inputFormatters,
    this.onChanged,
  });
  final Widget? icon;
  final Function(String)?onChanged;
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.0.height,
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          validator: validator,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: icon,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.1.h),
              borderRadius: BorderRadius.circular(16.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.1.h),
              borderRadius: BorderRadius.circular(16.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5.h),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.h),
              borderRadius: BorderRadius.circular(16.r),
            ),
            fillColor: Colors.blue[50],
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        24.0.height,
      ],
    );
  }
}
