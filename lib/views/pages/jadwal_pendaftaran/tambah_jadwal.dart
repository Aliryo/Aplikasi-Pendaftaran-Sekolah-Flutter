import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/jadwal_controller.dart';
import '../../widgets/widget_button.dart';
import '../../widgets/widget_input_text.dart';

class TambahJadwal extends StatelessWidget {
  TambahJadwal({super.key});
  final JadwalController controller = Get.find();
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
                child: const Icon(Icons.arrow_back_ios_new_rounded)),
            12.0.width,
            const Text(
              'Tambah Jadwal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            24.0.height,
            Text("Fase",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            8.0.height,
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.blue[50],
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                  elevation: 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.blue[50])),
              buttonStyleData: ButtonStyleData(
                  height: 60.h,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h)),
              isExpanded: true,
              hint: const Text(
                'Pilih fase',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              items: controller.listFase
                  .map((item) => DropdownMenuItem<int>(
                        value: item,
                        child: Text(
                          "Fase $item",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.setSelectedFase(value!);
              },
            ),
            16.0.height,
            WidgetInputText(
              title: "Judul",
              hintText: "Masukan judul jadwal",
              controller: controller.judulAddController,
              onChanged: controller.onJudulChange,
            ),
            controller.fase.value == 2 || controller.fase.value == 4
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      8.0.height,
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: controller.tanggalMulai.value,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100))
                              .then((value) {
                            controller.setTanggalMulai(value ?? DateTime.now());
                            controller
                                .setTanggalSelesai(value ?? DateTime.now());
                          });
                        },
                        child: Container(
                          height: 60.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.blue[50]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat("dd MMMM yyyy")
                                    .format(controller.tanggalMulai.value),
                              ),
                              Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.green.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Mulai",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                            8.0.height,
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate:
                                            controller.tanggalMulai.value,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100))
                                    .then((value) => controller.setTanggalMulai(
                                        value ?? DateTime.now()));
                              },
                              child: Container(
                                height: 60.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: Colors.blue[50]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat("dd MMM yyyy").format(
                                          controller.tanggalMulai.value),
                                    ),
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.green.withOpacity(0.5),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      8.0.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Selesai",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                            8.0.height,
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate:
                                            controller.tanggalSelesai.value,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100))
                                    .then((value) =>
                                        controller.setTanggalSelesai(
                                            value ?? DateTime.now()));
                              },
                              child: Container(
                                height: 60.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.blue[50],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat("dd MMM yyyy").format(
                                          controller.tanggalSelesai.value),
                                    ),
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.green.withOpacity(0.5),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
            16.0.height,
            WidgetInputText(
              controller: controller.deskripsiAddController,
              title: "Deskripsi",
              hintText: "Masukan Deskripsi",
              onChanged: controller.onDeskripsiChange,
              maxLine: 5,
            ),
            16.0.height,
            WidgetButton(
                disable: controller.isAddDisable.value,
                loading: controller.isAddLoading.value,
                title: "Tambah",
                onTap: () {
                  controller.addJadwal();
                })
          ],
        );
      }),
    );
  }
}
