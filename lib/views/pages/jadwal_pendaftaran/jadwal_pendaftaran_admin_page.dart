import 'package:aplikasi_pendaftaran_siswa/controller/jadwal_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/jadwal_pendaftaran/ubah_jadwal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JadwalPendaftaranAdminPage extends StatelessWidget {
  JadwalPendaftaranAdminPage({super.key});
  final JadwalController controller = Get.put(JadwalController());
  @override
  Widget build(BuildContext context) {
    Widget cardJadwal(JadwalModel jadwal) {
      return GestureDetector(
        onTap: () {
          controller.setJadwal(jadwal);
          Get.to(() => UbahJadwal());
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0.5,
                    blurRadius: 0.5)
              ]),
          child: Row(
            children: [
              Text(
                jadwal.fase.toString(),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              24.0.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jadwal.title ?? "",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    2.0.height,
                    Text(
                      jadwal.deskripsi ?? "",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    2.0.height,
                    Text(
                      jadwal.fase == 2 || jadwal.fase == 4
                          ? DateFormat("dd MMMM yyyy")
                              .format(jadwal.beginAt ?? DateTime.now())
                          : "${DateFormat("dd MMMM yyyy").format(jadwal.beginAt ?? DateTime.now())} - ${DateFormat("dd MMMM yyyy").format(jadwal.endAt ?? DateTime.now())}",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jadwal Pendaftaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: Colors.green),
              )
            : Column(
                children: [
                  24.0.height,
                  Expanded(
                      child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemBuilder: (context, index) =>
                        cardJadwal(controller.jadwals[index]),
                    itemCount: controller.jadwals.length,
                  ))
                ],
              );
      }),
    );
  }
}
