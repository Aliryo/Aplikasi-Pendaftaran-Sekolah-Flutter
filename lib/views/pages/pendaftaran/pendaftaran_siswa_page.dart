import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/select_picture.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_picture.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PendaftaranSiswaBaruPage extends StatelessWidget {
  PendaftaranSiswaBaruPage({super.key});
  final PendaftaranController controller = Get.put(PendaftaranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendaftaran Siswa Baru',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Ayo mari belajar bersama kami',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Obx(() {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            children: [
              WidgetInputText(
                controller: controller.namaLengkapController,
                title: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap anak anda',
                textInputType: TextInputType.name,
              ),
              WidgetInputText(
                  controller: controller.tanggalLahirController,
                  textInputType: TextInputType.datetime,
                  title: 'Tanggal Lahir',
                  hintText: 'Masukkan tanggal lahir anak anda'),
              WidgetInputText(
                  controller: controller.tempatLahirController,
                  title: 'Tempat Lahir',
                  hintText: 'Masukkan Tempat lahir anak anda'),
              WidgetInputText(
                  controller: controller.alamatController,
                  title: 'Alamat',
                  hintText: 'Masukkan alamat anak anda'),
              WidgetInputPicture(
                image: controller.fotoDiri.value,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SelectPicture(
                            galeryTap: () {
                              Get.back();
                              controller.camera(
                                  type: "Selfie", fromGalery: true);
                            },
                            cameraTap: () {
                              Get.back();
                              controller.camera(
                                  type: "Selfie", fromGalery: false);
                            },
                          ));
                },
                title: 'Foto Diri',
                subtitle: 'Masukan foto calon siswa',
              ),
              WidgetInputPicture(
                image: controller.aktaKelahiran.value,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SelectPicture(
                            galeryTap: () {
                              Get.back();
                              controller.camera(type: "Akta", fromGalery: true);
                            },
                            cameraTap: () {
                              Get.back();
                              controller.camera(
                                  type: "Akta", fromGalery: false);
                            },
                          ));
                },
                title: 'Foto Akta Kelahiran',
                subtitle: 'Masukan foto akta kelahiran calon siswa',
              ),
              //  WidgetInputPicture(
              //         onTap: () {
              //           controller.pickFotoBuktiPembayaran();
              //         },
              //         title: 'Foto Bukti Pembayaran',
              //         subtitle: 'Masukan foto bukti pembayaran',
              //       ),
              16.0.height,
              WidgetButton(
                loading: controller.isPendaftaranLoading.value,
                onTap: () {
                  // var sudahDaftar = GetStorage().read('sudahDaftar');
                  // sudahDaftar = sudahDaftar ?? false;
                  // if (sudahDaftar) {
                  //   Get.snackbar(
                  //     'Gagal',
                  //     'Anda sudah mendaftar sebelumnya',
                  //     backgroundColor: Colors.red,
                  //     colorText: Colors.white,
                  //   );
                  // } else {
                  controller.addPendaftarBaru();
                  // }
                },
                title: 'Daftar Sekarang',
              ),
            ],
          );
        }),
      ),
    );
  }
}
