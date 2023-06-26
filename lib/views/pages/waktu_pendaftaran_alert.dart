import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/jadwal_pendaftaran/jadwal_pendaftaran_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WaktuPendaftaranAlert extends StatelessWidget {
  const WaktuPendaftaranAlert({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: 900.w,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r))),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: const Text(
            'Pendaftaran Belum Dimulai',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.pendaftaran,
            width: 200.w,
          ),
          8.0.height,
          const Text(
            'Silahkan untuk mengecek jadwal pendaftaran, menuju halaman berikut',
            textAlign: TextAlign.center,
          ),
          32.0.height,
          Row(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Text(
                      'Kembali',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              16.0.width,
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Get.close(1);
                    Get.to(() => JadwalPendaftaranPage());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: const Text(
                      'Cek Jadwal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: header(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      content: content(),
      contentPadding: EdgeInsets.all(16.w),
    );
  }
}
