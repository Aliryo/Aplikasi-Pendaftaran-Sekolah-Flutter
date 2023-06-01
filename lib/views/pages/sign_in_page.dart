import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/sign_up_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masuk'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          children: [
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.0.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.search,
                controller: controller.emailLoginController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Masukan email anda',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            24.0.height,
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.0.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.search,
                controller: controller.passwordLoginController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Masukan password anda',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            42.0.height,
            WidgetButton(
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                        (route) => false);
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
      ),
    );
  }
}
