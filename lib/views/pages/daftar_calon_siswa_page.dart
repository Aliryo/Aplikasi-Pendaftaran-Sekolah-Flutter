import 'package:aplikasi_pendaftaran_siswa/views/pages/detail_calon_siswa_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_daftar_calon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaftarCalonSiswaPage extends StatelessWidget {
  const DaftarCalonSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Calon Siswa Baru',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          WidgetDaftarCalon(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCalonSiswaPage(),
                ),
              );
            },
            name: 'Aditya Putra',
            birth: 'Bandung, 16 Desember 2017',
            address:
                'Jl kemang 2, RT 01/Rw 02, Cilandak ,Jakarta Selatan, DKI Jakarta',
            accepted: true,
          ),
          WidgetDaftarCalon(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCalonSiswaPage(),
                ),
              );
            },
            name: 'Jefri Nichol',
            birth: 'Bandung, 12 Januari 2017',
            address:
                'Jl kemang 2, RT 01/Rw 02, Cilandak ,Jakarta Selatan, DKI Jakarta',
            accepted: true,
          ),
          WidgetDaftarCalon(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCalonSiswaPage(),
                ),
              );
            },
            name: 'Basuki Shihab',
            birth: 'Bandung, 6 Januari 2016',
            address:
                'Jl kemang 2, RT 01/Rw 02, Cilandak ,Jakarta Selatan, DKI Jakarta',
            accepted: false,
          ),
        ],
      ),
    );
  }
}
