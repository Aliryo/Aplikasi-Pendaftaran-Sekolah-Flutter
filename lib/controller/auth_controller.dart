import 'package:aplikasi_pendaftaran_siswa/data/model/user_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/auth_services.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/home_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final changePasswordController = TextEditingController();
  final nameAdminController = TextEditingController();
  final emailAdminController = TextEditingController();
  final passwordAdminController = TextEditingController();
  final confirmAdminContoller = TextEditingController();

  var isRegisterLoading = false.obs;
  var isLoginDisable = true.obs;
  var isAdminDisable = true.obs;
  var isRegisterDisable = true.obs;
  var isLoginLoading = false.obs;
  var isAddAdminLoading = false.obs;
  var hidePasswordRegister = true.obs;
  var hideConfirmRegister = true.obs;
  var hidePasswordAddAdmin = true.obs;
  var hideConfirmAddAdmin = true.obs;
  var hidePasswordLogin = true.obs;
  var user = UserModel().obs;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addAdminKey = GlobalKey<FormState>();

  void changeHidePasswordAddAdmin() =>
      hidePasswordAddAdmin.value = !hidePasswordAddAdmin.value;

  void changeHideConfirmAddAdmin() =>
      hideConfirmAddAdmin.value = !hideConfirmAddAdmin.value;

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

  clearAddAdmin() {
    isAddAdminLoading.value = false;
    emailAdminController.clear();
    passwordAdminController.clear();
    nameAdminController.clear();
    confirmAdminContoller.clear();
  }

  void clearLogin() {
    isLoginLoading.value = false;
    emailLoginController.clear();
    passwordLoginController.clear();
  }

  onEmailLogin(String value) {
    validateLogin();
  }

  onPasswordLogin(String value) {
    validateLogin();
  }

  validateLogin() {
    if (emailLoginController.text != '' &&
        passwordLoginController.text != '' &&
        EmailValidator.validate(emailLoginController.text)) {
      isLoginDisable.value = false;
    } else {
      isLoginDisable.value = true;
    }
  }

  onEmailRegister(String value) {
    validateRegister();
  }

  onPasswordRegister(String value) {
    validateRegister();
  }

  onConfirmPasswordRegister(String value) {
    validateRegister();
  }

  onNameRegister(String value) {
    validateRegister();
  }

  validateRegister() {
    if (emailController.text != '' &&
        passwordController.text != '' &&
        nameController.text != '' &&
        confirmController.text == passwordController.text &&
        EmailValidator.validate(emailController.text)) {
      isRegisterDisable.value = false;
    } else {
      isRegisterDisable.value = true;
    }
  }

  onEmailAdmin(String value) {
    validateAdmin();
  }

  onPasswordAdmin(String value) {
    validateAdmin();
  }

  onConfirmPasswordAdmin(String value) {
    validateAdmin();
  }

  onNameAdmin(String value) {
    validateAdmin();
  }

  validateAdmin() {
    if (emailAdminController.text != '' &&
        passwordAdminController.text != '' &&
        nameAdminController.text != '' &&
        confirmAdminContoller.text == passwordAdminController.text &&
        EmailValidator.validate(emailAdminController.text)) {
      isAdminDisable.value = false;
    } else {
      isAdminDisable.value = true;
    }
  }

  Future<void> addAdmin() async {
    try {
      if (addAdminKey.currentState != null) {
        if (addAdminKey.currentState!.validate()) {
          addAdminKey.currentState!.save();
          isAddAdminLoading.value = true;
          await AuthService().addAdmin(
            email: emailAdminController.text,
            password: passwordAdminController.text,
            name: nameAdminController.text,
          );
          Get.snackbar("Sukses", "Berhasil Menambahkan Admin Baru",
              backgroundColor: Colors.blue, colorText: Colors.white);
          clearAddAdmin();
        }
      }
    } catch (e) {
      isRegisterLoading.value = false;
      Get.snackbar("Gagal", "Mohon Periksa Data Kembali",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      throw Exception(e.toString());
    }
  }

  Future<void> register() async {
    try {
      if (registerKey.currentState != null) {
        if (registerKey.currentState!.validate()) {
          registerKey.currentState!.save();
          isRegisterLoading.value = true;
          var data = await AuthService().signUp(
              email: emailController.text,
              password: passwordController.text,
              name: nameController.text);
          user.value = data;
          Get.to(() => HomePage());
          clearRegister();
        }
      }
    } catch (e) {
      clearRegister();
      Get.snackbar("Gagal", "Email sudah terdaftar",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      throw Exception(e.toString());
    }
  }

  Future<void> login() async {
    try {
      if (loginKey.currentState != null) {
        if (loginKey.currentState!.validate()) {
          loginKey.currentState!.save();
          isLoginLoading.value = true;
          var data = await AuthService().signIn(
            email: emailLoginController.text,
            password: passwordLoginController.text,
          );
          user.value = data;
          Get.to(() => HomePage());
          clearLogin();
        }
      }
    } catch (e) {
      isLoginLoading.value = false;
      Get.snackbar("Gagal", "Email atau password salah",
          backgroundColor: Colors.red, colorText: Colors.white);
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await AuthService().signOut();
      Get.offAll(() => SignInPage());
    } catch (e) {
      Get.snackbar("Gagal", "Gagal keluar",
          backgroundColor: Colors.red, colorText: Colors.white);
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

  getUser() async {
    var role = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .snapshots()
        .first;
    return role;
  }

  changePassword() {
    if (changePasswordKey.currentState != null) {
      if (changePasswordKey.currentState!.validate()) {
        changePasswordKey.currentState!.save();
        AuthService().changePassword(changePasswordController.text);
        changePasswordController.text = '';
        Get.snackbar("Sukses", "Berhasil Mengubah Password",
            backgroundColor: Colors.blue, colorText: Colors.white);
      }
    }
  }
}
