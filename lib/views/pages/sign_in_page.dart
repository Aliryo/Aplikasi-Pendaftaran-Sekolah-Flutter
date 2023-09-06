import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/sign_up_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final AuthController controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masuk'),
      ),
      body: Obx(() {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.loginKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            children: [
              WidgetInputText(
                title: "Email",
                hintText: "Masukan email anda",
                validator: (value) => !EmailValidator.validate(value!)
                    ? "Format email tidak sesuai"
                    : value == ""
                        ? "Email tidak boleh kosong"
                        : null,
                controller: controller.emailLoginController,
                onChanged: controller.onEmailLogin,
              ),
              WidgetInputText(
                title: "Password",
                hintText: "Masukan password anda",
                validator: (value) =>
                    value == "" ? "Password tidak boleh kosong" : null,
                onChanged: controller.onPasswordLogin,
                icon: GestureDetector(
                    onTap: () => controller.changeHidePasswordLogin(),
                    child: Icon(
                      controller.hidePasswordLogin.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 24.h,
                    )),
                obscureText: controller.hidePasswordLogin.value,
                controller: controller.passwordLoginController,
              ),
              16.0.height,
              WidgetButton(
                disable: controller.isLoginDisable.value,
                loading: controller.isLoginLoading.value,
                onTap: () {
                  controller.login();
                },
                title: 'Masuk',
              ),
              24.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun? ',
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => SignUpPage());
                    },
                    child: const Text(
                      'Buat Akun Baru',
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
