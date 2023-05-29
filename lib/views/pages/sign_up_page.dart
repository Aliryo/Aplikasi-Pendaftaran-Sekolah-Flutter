import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/sign_in_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          const Text(
            'Nama Lengkap',
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
              textInputAction: TextInputAction.search,controller: controller.nameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukan nama lengkap anda',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          24.0.height,
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
              textInputAction: TextInputAction.search,controller: controller.emailController,
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
              textInputAction: TextInputAction.search,controller: controller.passwordController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukan password anda',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          24.0.height,
          const Text(
            'Konfirmasi Password',
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
              textInputAction: TextInputAction.search,controller: controller.confirmController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Konfirmasi password anda',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          42.0.height,
          WidgetButton(
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
  }
}
