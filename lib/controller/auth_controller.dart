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
  var hidePasswordRegister = true.obs;
  var hideConfirmRegister = true.obs;
  var hidePasswordLogin = true.obs;
  var user = UserModel().obs;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  void changeHidePasswordRegister() =>
      hidePasswordRegister.value = !hidePasswordRegister.value;

  void changeHideConfirmRegister() =>
      hideConfirmRegister.value = !hideConfirmRegister.value;

  void changeHidePasswordLogin() =>
      hidePasswordLogin.value = !hidePasswordLogin.value;

  void clearRegister() {
    isRegisterLoading.value = false;
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmController.clear();
  }

  void clearLogin() {
    isLoginLoading.value = false;
    emailLoginController.clear();
    passwordLoginController.clear();
  }

  Future<void> register() async {
    try {
      isRegisterLoading.value = true;
      var data = await AuthService().signUp(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text);
      user.value = data;
      Get.to(() => HomePage());
      clearRegister();
    } catch (e) {
      clearRegister();
      Get.snackbar("Gagal", "Email sudah terdaftar",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
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
      Get.to(() => HomePage());
      clearLogin();
    } catch (e) {
      clearLogin();
      Get.snackbar("Gagal", "Email atau password salah",
          backgroundColor: Colors.red, colorText: Colors.white);
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
