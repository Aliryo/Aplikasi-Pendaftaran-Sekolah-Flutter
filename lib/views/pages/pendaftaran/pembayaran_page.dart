import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/src/app_images.dart';
import '../../widgets/select_picture.dart';

class PembayaranPage extends StatelessWidget {
  PembayaranPage({super.key});
  final PendaftaranController controller =
      Get.isRegistered() ? Get.find() : Get.put(PendaftaranController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24.h,
                )),
            12.0.width,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembayaran',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Ayo lakukan pembayaran segera',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Obx(() {
          return Column(
            children: [
              16.0.height,
              Text(
                "Terimakasih sudah mengisi formulir pendaftaran Silahkan lakukan pembayaran untuk biaya pendaftaran ke nomor rekenign berikut :",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                textAlign: TextAlign.justify,
              ),
              36.0.height,
              Image.asset(
                AppImages.briIcon,
                width: 120.w,
              ),
              Text(
                "68600278835826653",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              4.0.height,
              const Text(
                "Atas nama : Kurniawan Sinaga",
              ),
              4.0.height,
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Jumlah Pembayaran : ",
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: "Rp 100.000",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.green)),
              ])),
              36.0.height,
              WidgetInputPicture(
                  title: "Upload bukti pembayaran",
                  subtitle: 'Masukan Bukti pembayaran',
                  image: controller.buktiPembayaran.value,onTap: () {
                                      showDialog(
                      context: context,
                      builder: (context) => SelectPicture(
                            galeryTap: () {
                              Get.back();
                              controller.camera(
                                  type: "BuktiPembayaran", fromGalery: true);
                            },
                            cameraTap: () {
                              Get.back();
                              controller.camera(
                                  type: "BuktiPembayaran", fromGalery: false);
                            },
                          ));

                  },),
      
              WidgetButton(
                  margin: EdgeInsets.symmetric(vertical: 36.h),
                  title: "Konfirmasi Pembayaran",
                  onTap: () {})
            ],
          );
        }),
      ),
    );
  }
}
