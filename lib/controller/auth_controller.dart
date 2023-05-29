import 'package:aplikasi_pendaftaran_siswa/data/model/user_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/auth_services.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/user_service.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final emailLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  var isRegisterLoading = false.obs;
  var isLoginLoading = false.obs;
  var user = UserModel().obs;

  Future<void> register() async {
    try {
      isRegisterLoading.value = true;
      var data = await AuthService().signUp(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text);
      user.value = data;
      Get.to(() => const HomePage());
      isRegisterLoading.value = false;
    } catch (e) {
      isRegisterLoading.value = false;
      throw Exception(e.toString());
    }
  }

  Future<void> login() async {
    try {
      isLoginLoading.value = true;
      var data = await AuthService().signIn(
        email: emailLoginController.text,
        password: passwordLoginController.text,
      );
      user.value = data;
      Get.to(() => const HomePage());
      isLoginLoading.value = false;
    } catch (e) {
      isLoginLoading.value = false;

      throw Exception(e.toString());
    }
  }
   void getCurrentUser(String id) async {
    try {
     var data = await UserService().getUser(id);
   user.value = data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
