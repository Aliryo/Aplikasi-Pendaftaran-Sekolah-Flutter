import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/contact_us_alert.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/daftar_calon_siswa_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/pendaftaran_siswa_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/profil_sekolah_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_card_home.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_news_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
              'Hallo, Jefri Nichol',
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
            children: [
              WidgetCardHome(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PendaftaranSiswaBaruPage(),
                    ),
                  );
                },
                image: AppImages.register,
                title: 'Pendaftaran\nSiswa baru',
              ),
              WidgetCardHome(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DaftarCalonSiswaPage(),
                    ),
                  );
                },
                image: AppImages.student,
                title: 'Daftar\nCalon Siswa',
              ),
              WidgetCardHome(
                onTap: () {},
                image: AppImages.schedule,
                title: 'Jadwal\nPendaftaran',
              ),
              WidgetCardHome(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilSekolahPage(),
                    ),
                  );
                },
                image: AppImages.school,
                title: 'Profil Sekolah',
              ),
              WidgetCardHome(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const ContactUsAlert());
                },
                image: AppImages.contactUs,
                title: 'Hubungi Kami',
              ),
              WidgetCardHome(
                onTap: () {},
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
          16.0.height,
          CarouselSlider(
            items: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppImages.kegiatan,
                  width: 360.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            options: CarouselOptions(
              height: 180.h,
              viewportFraction: 1,
              autoPlay: true,
              initialPage: 0,
              onPageChanged: (index, reason) {},
            ),
          ),
          4.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              indicator(1),
            ],
          ),
          16.0.height,
          const Text(
            'Berita Sekolah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          16.0.height,
          const WidgetNewsList(
            image: AppImages.berita1,
            title: 'Acara halal bihalal setelah Idul Fitri',
            subtitle:
                'Setelah libur lebaran idul fitri selesai, sekolah mengadakan acara halal bihalal antara guru dan murid, sebagai bentuk pengajaran pendidikan.',
            date: 'Senin, 27 April 2023',
          ),
          const WidgetNewsList(
            image: AppImages.berita2,
            title: 'Persipan lomba pesta siaga',
            subtitle:
                'Dalam rangka menyambut perlombaan persta siaga antar SD di kecamatan tembalang, semarang, siswa mengadakan latihan kegiatan.',
            date: 'Senin, 26 April 2023',
          ),
        ],
      ),
    );
  }

  Widget indicator(int index) {
    return Container(
      width: 40.w,
      height: 8.h,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(3.w)),
    );
  }
}
