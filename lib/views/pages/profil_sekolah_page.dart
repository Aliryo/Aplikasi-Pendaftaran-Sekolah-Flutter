import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilSekolahPage extends StatelessWidget {
  const ProfilSekolahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Sekolah',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Selamat datang di SDN 57 Jakarta',
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
          Image.asset(
            AppImages.splash,
            height: 80.w,
          ),
          16.0.height,
          const Center(
            child: Text(
              'SD Negeri 1 Bandung',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          4.0.height,
          const Center(
            child: Text(
              'Jln, raya sambiroto no 58, kec tembalang, semarang kota, jawa tengah. 54472',
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
                    'Negeri',
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
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppImages.profile1,
                  width: 360.w,
                  height: 214.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            options: CarouselOptions(
              height: 214.h,
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
          32.0.height,
          const Text(
            'Visi',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          8.0.height,
          const Text(
            'Untuk mewujudkan tujuan pendidikan di Indonesia di jenjang pendidikan dasar, '
            'maka SD Negeri Baluwarti berkeinginan mewujudkannya dengan disesuaikan visi sekolah yaitu :\n'
            '“Terciptanya sekolah ramah anak, unggul dalam prestasi, berkarakter, berakar pada budaya bangsa dan '
            'berwawasan lingkungan berdasarkan ketakwaan dan ilmu pengetahuan”',
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
            'Untuk mewujudkan tujuan pendidikan di Indonesia di jenjang pendidikan dasar, '
            'maka SD Negeri Baluwarti berkeinginan mewujudkannya dengan disesuaikan visi sekolah yaitu :\n'
            '“Terciptanya sekolah ramah anak, unggul dalam prestasi, berkarakter, berakar pada budaya bangsa dan '
            'berwawasan lingkungan berdasarkan ketakwaan dan ilmu pengetahuan”',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12),
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
