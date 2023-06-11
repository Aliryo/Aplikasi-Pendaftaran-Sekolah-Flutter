import 'dart:io';

import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/src/app_images.dart';

class WidgetInputPicture extends StatelessWidget {
  const WidgetInputPicture(
      {super.key,
      required this.title,
      this.onTap,
      required this.subtitle,
      required this.image});
  final String title;
  final String subtitle;
  final Function()? onTap;
  final File image;

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
        Container(
          padding: EdgeInsets.all(12.h),
          height: 160.h,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            children: [
              image.path.isNotEmpty
                  ? Image.file(
                      image,
                     width: double.infinity,height: 160.h,fit: BoxFit.cover,
                    )
                  : const SizedBox(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(   onTap: onTap,
                      child: Image.asset(
                        AppImages.camera,
                        width: 60.w,
                        height: 60.w,
                      ),
                    ),
                    8.0.height,
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style:  TextStyle(color:image.path.isNotEmpty? Colors.white: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        24.0.height,
      ],
    );
  }
}
