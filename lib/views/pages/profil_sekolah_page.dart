import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilSekolahPage extends StatelessWidget {
  const ProfilSekolahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new_rounded)),
            12.0.width,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profil Sekolah',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Selamat datang di SDIP Baitussalam',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          Image.asset(
            AppImages.logo,
            height: 100.w,
          ),
          16.0.height,
          const Center(
            child: Text(
              'SDIP Baitussalam Kuningan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          4.0.height,
          const Center(
            child: Text(
              'Jl. Blok Cikedung, Kelurahan Cirendang, Kecamatan Kuningan, Kabupaten Kuningan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          32.0.height,
          const Text(
            'Identitas Sekolah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          16.0.height,
          Table(
            columnWidths: {
              0: FixedColumnWidth(140.w),
              1: const FlexColumnWidth(),
            },
            children: const [
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Status Sekolah   :'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Swasta',
                    textAlign: TextAlign.right,
                  ),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Akreditasi            :'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'A',
                    textAlign: TextAlign.right,
                  ),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Telepon                :'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '(0274)098329823',
                    textAlign: TextAlign.right,
                  ),
                )
              ]),
            ],
            border: TableBorder.all(width: 0, color: Colors.transparent),
          ),
          32.0.height,
          CarouselSlider(
            items: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    AppImages.profile1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 214.h,
              viewportFraction: 1,
              autoPlay: false,
              initialPage: 0,
              onPageChanged: (index, reason) {},
            ),
          ),
          32.0.height,
          const Text(
            'Visi',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          8.0.height,
          const Text(
            'Visi SDIP BAITUSSALAM adalah “Mewujudkan generasi Qur’ani yang berkwalitas, unggul dan berdaya guna”',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12),
          ),
          16.0.height,
          const Text(
            'Misi',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          8.0.height,
          const Text(
            '- Menumbuhkan budaya islam dilingkungan sekolah'
            '\n\n- Melaksanakan pendidikan sekolah dasar islam secara menyeluruh (kaffah) untuk membangun akhlakul karimah, siswa, dan civitas Akademika'
            '\n\n- Menciptakan pembelajaran yang Aktif, Inovatif kreatif, dan menyenangkan (PAIKEM)'
            '\n\n- Membiasakan membaca dan memahami Al Qur’an dan Hadits'
            '\n\n- Menciptakan lingkungan sekolah berbasis multimedia'
            '\n\n- Mengembangkan dan menyalurkan bakat, minat, dan potensi siswa secara maksimal melalui kegiatan ekstrakurikuler'
            '\n\n- Mengarahkan peserta didik menuju Pribadi yang Mandiri dan Agamis'
            '\n\n- Menjadi sekolah unggulan di Kabupaten Kuningan dan sekitarnya',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
