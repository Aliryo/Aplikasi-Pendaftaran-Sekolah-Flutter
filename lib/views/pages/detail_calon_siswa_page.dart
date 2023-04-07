import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCalonSiswaPage extends StatelessWidget {
  const DetailCalonSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Calon Siswa Baru',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                AppImages.bocil,
              ),
            ),
          ),
          24.0.height,
          Table(
            columnWidths: {
              0: FixedColumnWidth(160.w),
              1: const FlexColumnWidth(),
            },
            children: const [
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Nama'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Muhammad Ali Firdaus'),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Tempat Tanggal Lahir'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Bandung, 18 April 2017'),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Alamat'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Jl kemang 2, RT 01/Rw 02, Cilandak ,Jakarta Selatan, DKI Jakarta'),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Status'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Diterima',
                    style: TextStyle(color: Colors.green),
                  ),
                )
              ]),
            ],
            border: TableBorder.all(width: 0, color: Colors.transparent),
          ),
          32.0.height,
          const Text(
            'Selamat anda dinyatakan lolos seleksi dan diterima sebagai siswa dari SDN 1 Bandung',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
