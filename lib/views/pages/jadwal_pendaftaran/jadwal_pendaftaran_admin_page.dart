// ignore_for_file: depend_on_referenced_packages

import 'package:aplikasi_pendaftaran_siswa/controller/jadwal_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/helper.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/jadwal_pendaftaran/tambah_jadwal.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/jadwal_pendaftaran/ubah_jadwal.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JadwalPendaftaranAdminPage extends StatelessWidget {
  JadwalPendaftaranAdminPage({super.key});
  final JadwalController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Widget cardJadwal(JadwalModel jadwal) {
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                spacing: 10,
                flex: 8,
                borderRadius: BorderRadius.circular(12.r),
                onPressed: (context) {
                  controller.deleteJadwal(jadwal.id ?? '');
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Hapus',
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              controller.setJadwal(jadwal);
              Get.to(() => UbahJadwal());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
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
                  Image.asset(
                    Helper.jadwalImage(jadwal.fase ?? 1),
                    height: 80.w,
                    width: 80.w,
                  ),
                  12.0.width,
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
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
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
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded)),
            12.0.width,
            const Text(
              'Jadwal Pendaftaran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
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
                  )),
                  controller.jadwals.length < 4
                      ? WidgetButton(
                          title: "Tambah Jadwal",
                          onTap: () {
                            controller.removeFase();
                            Get.to(() => TambahJadwal());
                          },
                          margin: EdgeInsets.only(
                              bottom: 32.h, left: 24.w, right: 24.w, top: 16.h),
                        )
                      : const SizedBox()
                ],
              );
      }),
    );
  }
}
