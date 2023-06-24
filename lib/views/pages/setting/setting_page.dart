import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/setting/tambah_admin_page.dart.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../data/src/app_images.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    Widget cardSetting({
      Function()? onTap,
      required Widget icon,
      required String title,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            icon,
            8.0.width,
            Expanded(
              child: Text(title,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.w,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 36.h,
            height: 36.h,
            margin: EdgeInsets.only(left: 8.w),
            padding: EdgeInsets.all(6.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.green.withOpacity(0.15)),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24.h,
                color: Colors.green,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              16.0.height,
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
                        (authController.user.value.role ?? '').capitalize ?? "",
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
              16.0.height,
              const Divider(
                thickness: 1,
                color: Colors.green,
              ),
              24.0.height,
              cardSetting(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.h, vertical: 32.h),
                                child: Form(
                                  key: authController.changePasswordKey,
                                  child: Column(
                                    children: [
                                      WidgetInputText(
                                        controller: authController
                                            .changePasswordController,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 6) {
                                            return 'Password Minimal 6 Karakter';
                                          }
                                          return null;
                                        },
                                        title: 'Ubah Password',
                                        hintText: 'Masukkan Password Baru',
                                      ),
                                      WidgetButton(
                                        title: 'Simpan',
                                        onTap: () {
                                          authController.changePassword();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.password,
                    color: Colors.green,
                  ),
                  title: "Ubah Password"),
              authController.user.value.role == "admin"
                  ? Column(
                      children: [
                        16.0.height,
                        cardSetting(
                            onTap: () {
                              Get.to(() => TambahAdminPage());
                            },
                            icon: const Icon(
                              Icons.person_add,
                              color: Colors.green,
                            ),
                            title: "Tambah Admin"),
                      ],
                    )
                  : const SizedBox(),
              16.0.height,
              cardSetting(
                  onTap: () {
                    authController.logout();
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.green,
                  ),
                  title: "Keluar"),
              16.0.height,
            ],
          ),
        );
      }),
    );
  }
}
