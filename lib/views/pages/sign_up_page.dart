import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/sign_in_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../widgets/widget_input_text.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: Obx(() {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.registerKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            children: [
              WidgetInputText(
                title: "Nama",
                hintText: "Masukan nama anda",
                validator: (value) =>
                    value == "" ? "Nama tidak boleh kosong" : null,
                controller: controller.nameController,
              ),
              WidgetInputText(
                title: "Email",
                hintText: "Masukan email anda",
                validator: (value) => !EmailValidator.validate(value ?? '')
                    ? "Format email tidak sesuai"
                    : value == ""
                        ? "Email tidak boleh kosong"
                        : null,
                controller: controller.emailController,
              ),
              WidgetInputText(
                title: "Password",
                hintText: "Masukan password anda",
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password Minimal 6 Karakter';
                  }
                  return null;
                },
                icon: GestureDetector(
                    onTap: () => controller.changeHidePasswordRegister(),
                    child: Icon(
                      controller.hidePasswordRegister.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 24.h,
                    )),
                obscureText: controller.hidePasswordRegister.value,
                controller: controller.passwordController,
              ),
              WidgetInputText(
                title: "Konfirmasi Password",
                hintText: "Masukan password anda",
                validator: (value) =>
                    value != controller.passwordController.text
                        ? "Password tidak sama"
                        : value == ""
                            ? "Password tidak boleh kosong"
                            : null,
                icon: GestureDetector(
                    onTap: () => controller.changeHideConfirmRegister(),
                    child: Icon(
                      controller.hideConfirmRegister.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 24.h,
                    )),
                obscureText: controller.hideConfirmRegister.value,
                controller: controller.confirmController,
              ),
              16.0.height,
              WidgetButton(
                loading: controller.isRegisterLoading.value,
                onTap: () {
                  controller.register();
                },
                title: 'Daftar',
              ),
              24.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun? ',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
