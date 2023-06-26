import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TambahAdminPage extends StatelessWidget {
  TambahAdminPage({super.key});
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                  controller.clearAddAdmin();
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded)),
            12.0.width,
            const Text(
              'Tambah Admin Baru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.addAdminKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            children: [
              WidgetInputText(
                controller: controller.nameAdminController,
                onChanged: controller.onNameAdmin,
                title: 'Nama',
                hintText: 'Masukan nama admin baru',
                validator: (value) =>
                    value == "" ? "Nama tidak boleh kosong" : null,
              ),
              WidgetInputText(
                onChanged: controller.onEmailAdmin,
                controller: controller.emailAdminController,
                title: 'Email',
                hintText: 'Masukan email admin baru',
                validator: (value) => !EmailValidator.validate(value ?? '')
                    ? "Format email tidak sesuai"
                    : value == ""
                        ? "Email tidak boleh kosong"
                        : null,
              ),
              WidgetInputText(
                onChanged: controller.onPasswordAdmin,
                controller: controller.passwordAdminController,
                title: 'Password',
                hintText: 'Masukan password admin baru',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password Minimal 6 Karakter';
                  }
                  return null;
                },
                icon: GestureDetector(
                    onTap: () => controller.changeHidePasswordAddAdmin(),
                    child: Icon(
                      controller.hidePasswordAddAdmin.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 24.h,
                    )),
                obscureText: controller.hidePasswordAddAdmin.value,
              ),
              WidgetInputText(
                controller: controller.confirmAdminContoller,
                onChanged: controller.onConfirmPasswordAdmin,
                title: 'Konfirmasi Password',
                hintText: 'Masukan password admin baru',
                validator: (value) =>
                    value != controller.passwordAdminController.text
                        ? "Password tidak sama"
                        : value == ""
                            ? "Password tidak boleh kosong"
                            : null,
                icon: GestureDetector(
                  onTap: () => controller.changeHideConfirmAddAdmin(),
                  child: Icon(
                    controller.hideConfirmAddAdmin.value
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24.h,
                  ),
                ),
                obscureText: controller.hideConfirmAddAdmin.value,
              ),
              16.0.height,
              WidgetButton(
                disable: controller.isAdminDisable.value,
                loading: controller.isAddAdminLoading.value,
                title: 'Tambah Admin',
                onTap: () {
                  controller.addAdmin();
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
