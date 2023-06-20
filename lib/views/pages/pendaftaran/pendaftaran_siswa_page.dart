import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/pendaftaran/pembayaran_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/select_picture.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_picture.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

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
                onChanged: controller.onNameChange,
                textInputType: TextInputType.name,
              ),
              SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tanggal Lahir",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.0.height,
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: controller.selectedDate.value,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100))
                          .then((value) => controller
                              .setSelectedDate(value ?? DateTime.now()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue[50],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat("dd MMMM yyyy")
                                .format(controller.selectedDate.value),
                          ),
                          const Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
              16.0.height,
              WidgetInputText(
                  controller: controller.tempatLahirController,
                  title: 'Tempat Lahir',
                  onChanged: controller.onTempatChange,
                  hintText: 'Masukkan Tempat lahir anak anda'),
              WidgetInputText(
                  controller: controller.alamatController,
                  title: 'Alamat',
                  onChanged: controller.onAlamatChange,
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
              16.0.height,
              WidgetButton(
                disable: controller.pendaftaraninValid.value,
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
                    Get.to(() => PembayaranPage(
                          controller: controller,
                        ));
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
