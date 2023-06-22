import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/alert_ditolak.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailCalonSiswaPage extends StatelessWidget {
  DetailCalonSiswaPage({super.key, required this.pendaftaran});
  final AuthController authController = Get.find();
  final PendaftaranModel pendaftaran;
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
              child: Image.network(
                pendaftaran.selfieUrl ?? "",
                width: 240.w,
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
                    style: const TextStyle(color: Colors.green),
                  ),
                )
              ]),
              if (authController.user.value.role == 'admin')
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Foto Akta kelahiran'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ]),
            ],
            border: TableBorder.all(width: 0, color: Colors.transparent),
          ),
          authController.user.value.role == 'admin' ? 16.0.height : 32.0.height,
          authController.user.value.role == 'admin'
              ? Container(
                  width: double.infinity,
                  height: 280.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.green),
                    color: Colors.green[200],
                  ),
                )
              : const Text(
                  'Selamat anda dinyatakan lolos seleksi dan diterima sebagai siswa dari SDIP Baitussalam Kuningan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
          authController.user.value.role == 'admin'
              ? 32.0.height
              : const SizedBox(),
          authController.user.value.role == 'admin'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: WidgetButton(
                        onTap: () {},
                        title: 'Terima',
                      ),
                    ),
                    16.0.width,
                    Expanded(
                        child: WidgetButton(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDitolak());
                      },
                      title: 'Tolak',
                      color: Colors.redAccent,
                    )),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
