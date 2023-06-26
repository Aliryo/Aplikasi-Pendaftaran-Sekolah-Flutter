import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/controller/jadwal_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/alert_ditolak.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailCalonSiswaPage extends StatelessWidget {
  DetailCalonSiswaPage({super.key, required this.pendaftaran});
  final AuthController authController = Get.find();
  final PendaftaranController pendaftaranController = Get.find();
  final JadwalController jadwalController = Get.find();
  final PendaftaranModel pendaftaran;

  @override
  Widget build(BuildContext context) {
    Widget admin() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.0.height,
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              "Foto akta Kelahiran",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
          ),
          8.0.height,
          GestureDetector(
            onTap: () {
              showImageViewer(
                context,
                Image.network(pendaftaran.aktaUrl ?? '').image,
              );
            },
            child: Container(
              width: double.infinity,
              height: 220.h,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.green),
              ),
              child:
                  Image.network(pendaftaran.aktaUrl ?? '', fit: BoxFit.cover),
            ),
          ),
          16.0.height,
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              "Bukti pembayaran",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
          ),
          8.0.height,
          GestureDetector(
            onTap: () {
              showImageViewer(
                context,
                Image.network(pendaftaran.pembayaranUrl ?? '').image,
              );
            },
            child: Container(
              width: double.infinity,
              height: 220.h,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.green),
              ),
              child: Image.network(
                pendaftaran.pembayaranUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (pendaftaran.status == 'Diproses') 24.0.height,
          if (pendaftaran.status == 'Diproses')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: WidgetButton(
                    onTap: () {
                      pendaftaranController.updatePendaftaran(
                        id: pendaftaran.id ?? '',
                        status: "Diterima",
                      );
                    },
                    title: 'Terima',
                  ),
                ),
                16.0.width,
                Expanded(
                    child: WidgetButton(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDitolak(id: pendaftaran.id ?? ''));
                  },
                  title: 'Tolak',
                  color: Colors.redAccent,
                )),
              ],
            )
        ],
      );
    }

    Widget user() {
      return Obx(() {
        return DateTime.now().isAfter(jadwalController.jadwals[1].beginAt!)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.0.height,
                  Text(
                    pendaftaran.status == 'diterima'
                        ? 'Selamat anak anda dinyatakan lolos seleksi dan diterima sebagai siswa dari SDIP Baitussalam Kuningan'
                        : "Mohon maaf  anak anda dinyatakan lolos seleksi dikarenakan ${pendaftaran.descStatus}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            : const SizedBox();
      });
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
              'Detail Calon Siswa baru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showImageViewer(
                  context,
                  Image.network(pendaftaran.selfieUrl ?? '').image,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  pendaftaran.selfieUrl ?? "",
                  width: 240.w,
                ),
              ),
            ),
          ),
          24.0.height,
          Table(
            columnWidths: {
              0: FixedColumnWidth(160.w),
              1: const FlexColumnWidth(),
            },
            children: [
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const Text('Nama'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Text((pendaftaran.namaLengkap ?? '').capitalize!),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const Text('Tempat Tanggal Lahir'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Text(
                      "${(pendaftaran.tempatLahir ?? '').capitalize}, ${DateFormat("dd MMMM yyyy").format(pendaftaran.tanggalLahir ?? DateTime.now())}"),
                )
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const Text('Alamat'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Text(pendaftaran.alamat ?? ''),
                )
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Status'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    pendaftaran.status ?? '',
                    style: TextStyle(
                      color: pendaftaran.status == 'Diproses'
                          ? Colors.blue
                          : pendaftaran.status == 'Diterima'
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                )
              ]),
            ],
            border: TableBorder.all(width: 0, color: Colors.transparent),
          ),
          FutureBuilder(
            future: authController.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data as QuerySnapshot;
              var role = (data.docs[0]['role']);
              if (snapshot.hasData) {
                if (role == 'admin') {
                  return admin();
                } else {
                  return user();
                }
              }
              return user();
            },
          ),
        ],
      ),
    );
  }
}
