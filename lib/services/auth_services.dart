import 'dart:developer';

import 'package:aplikasi_pendaftaran_siswa/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> addAdmin({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        role: 'admin',
      );
      await UserService().setUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      log("====Register=====");
      log(userCredential.toString());
      UserModel user = UserModel(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          role: 'member');

      await UserService().setUser(user);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log("Login===== $userCredential");
      UserModel user = await UserService().getUser(userCredential.user!.uid);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  changePassword(String newPassword) async {
    await _auth.currentUser!.updatePassword(newPassword);
  }
}
