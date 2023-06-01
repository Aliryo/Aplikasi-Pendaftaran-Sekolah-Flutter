import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/home_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_picture.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendaftaranSiswaBaruPage extends StatelessWidget {
  const PendaftaranSiswaBaruPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendaftaran Siswa Baru',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Ayo mari belajar bersama kami',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          const WidgetInputText(
              title: 'Nama Lengkap',
              hintText: 'Masukkan nama lengkap anak anda'),
          const WidgetInputText(
              title: 'Tanggal Lahir',
              hintText: 'Masukkan tanggal lahir anak anda'),
          const WidgetInputText(
              title: 'Tempat Lahir',
              hintText: 'Masukkan Tempat lahir anak anda'),
          const WidgetInputText(
              title: 'Alamat', hintText: 'Masukkan alamat anak anda'),
          WidgetInputPicture(
            onTap: () {},
            title: 'Foto Diri',
            subtitle: 'Masukan foto calon siswa',
          ),
          WidgetInputPicture(
            onTap: () {},
            title: 'Foto Akta Kelahiran',
            subtitle: 'Masukan foto akta kelahiran calon siswa',
          ),
          WidgetInputPicture(
            onTap: () {},
            title: 'Foto Bukti Pembayaran',
            subtitle: 'Masukan foto bukti pembayaran',
          ),
          16.0.height,
          WidgetButton(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false);
            },
            title: 'Daftar Sekarang',
          ),
        ],
      ),
    );
  }
}
