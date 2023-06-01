import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../data/src/app_images.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    Widget cardSetting({
      required Widget icon,
      required String title,
    }) {
      return Row(
        children: [
          icon,
          8.0.width,
          Expanded(
            child: Text(title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18.w,
          )
        ],
      );
    }

    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                32.0.height,
                Row(
                  children: [
                    Image.asset(
                      AppImages.avatar,
                      width: 80.h,
                    ),
                    16.0.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authController.user.value.name ?? '',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        4.0.height,
                        Text(
                          authController.user.value.email ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.0.height,
                        Text(
                          (authController.user.value.role ?? '').capitalize ??
                              "",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: authController.user.value.role == 'member'
                                  ? Colors.green
                                  : Colors.amber),
                        ),
                      ],
                    ),
                  ],
                ),
                48.0.height,
                cardSetting(
                    icon: Icon(Icons.health_and_safety_rounded),
                    title: "Ubah Password")
              ],
            ),
          ),
        );
      }),
    );
  }
}
