import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/helper.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/jadwal_controller.dart';

class JadwalPendaftaranPage extends StatelessWidget {
  JadwalPendaftaranPage({super.key});
  final JadwalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Widget step(JadwalModel jadwal) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${jadwal.fase}. ${jadwal.title}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            30.0.height,
            Center(
              child: Image.asset(
                Helper.jadwalImage(jadwal.fase!),
                height: 280.h,
              ),
            ),
            48.0.height,
            jadwal.fase == 2 || jadwal.fase == 4
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal :",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        DateFormat("dd MMMM yyyy")
                            .format(jadwal.beginAt ?? DateTime.now()),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal :",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${DateFormat("dd MMMM yyyy").format(jadwal.beginAt ?? DateTime.now())} - ${DateFormat("dd MMMM yyyy").format(jadwal.beginAt ?? DateTime.now())}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
            16.0.height,
            Text(
              "Keterangan",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            8.0.height,
            Text(
              jadwal.deskripsi ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
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
                  controller.currentStep.value > 0
                      ? controller.changeStep(controller.currentStep.value -= 1)
                      : Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                )),
            16.0.width,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Obx(() {
          return Column(
            children: [
              WidgetStepper(currentStep: controller.currentStep.value),
              30.0.height,
              controller.currentStep.value == 0
                  ? step(controller.jadwals.first)
                  : controller.currentStep.value == 1
                      ? step(controller.jadwals[1])
                      : controller.currentStep.value == 2
                          ? step(controller.jadwals[2])
                          : step(controller.jadwals.last),
              const Spacer(),
              controller.currentStep.value == 3
                  ? const SizedBox()
                  : WidgetButton(
                      title: "Selanjutnya",
                      onTap: () {
                        controller.changeStep(controller.currentStep.value == 0
                            ? 1
                            : controller.currentStep.value == 1
                                ? 2
                                : 3);
                      })
            ],
          );
        }),
      ),
    );
  }
}
