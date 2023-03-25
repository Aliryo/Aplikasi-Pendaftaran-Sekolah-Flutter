import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_card_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(6.w),
          child: Image.asset(
            AppImages.avatar,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo, Adit Putra Legeda',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Selamat datang di SDN 57 Jakarta',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          const Text(
            'Daftar Menu',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          16.0.height,
          Wrap(
            runSpacing: 16.h,
            spacing: 8.w,
            children: const [
              WidgetCardHome(
                image: AppImages.register,
                title: 'Pendaftaran\nSiswa baru',
              ),
              WidgetCardHome(
                image: AppImages.student,
                title: 'Daftar\nCalon Siswa',
              ),
              WidgetCardHome(
                image: AppImages.schedule,
                title: 'Jadwal\nPendaftaran',
              ),
              WidgetCardHome(
                image: AppImages.school,
                title: 'Profil Sekolah',
              ),
              WidgetCardHome(
                image: AppImages.contactUs,
                title: 'Hubungi Kami',
              ),
              WidgetCardHome(
                image: AppImages.setting,
                title: 'Pengaturan',
              ),
            ],
          ),
          16.0.height,
          const Text(
            'Kegiatan Sekolah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
