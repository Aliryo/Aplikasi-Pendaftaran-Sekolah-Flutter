import 'dart:async';

import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Image.asset(
          AppImages.splash,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }
}
