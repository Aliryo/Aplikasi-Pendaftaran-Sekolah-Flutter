import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/jadwal_controller.dart';

class UbahJadwal extends StatelessWidget {
  UbahJadwal({super.key});
  final JadwalController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ubah Jadwal',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          24.0.height,
          Text("Pay Method",
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
                    color: Colors.white)),
            buttonStyleData: ButtonStyleData(
                height: 60.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h)),
            isExpanded: true,
            hint: const Text(
              'Pilih fase',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            items: controller.jadwals
                .map((item) => DropdownMenuItem<JadwalModel>(
                      value: item,
                      child: Text(
                        "Fase ${item.fase}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              // transactionController.setSelectedPayment(value ?? '');
            },
          ),
          16.0.height,
          WidgetInputText(title: "Judul", hintText: "Masukan judul jadwal"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
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
                          // showDatePicker(
                          //         context: context,
                          //         initialDate:
                          //             walletController.startdate.value,
                          //         firstDate: DateTime(2000),
                          //         lastDate: DateTime(2100))
                          //     .then((value) => walletController
                          //         .setStartDate(value ?? DateTime.now()));
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
                                DateFormat("dd-MM-yyyy").format(DateTime.now()),
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
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
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
                          // showDatePicker(
                          //         context: context,
                          //         initialDate:DateTime.now(),

                          //         firstDate: DateTime(2000),
                          //         lastDate: DateTime(2100))
                          //     .then((value) => walletController
                          //         .setEndDate(value ?? DateTime.now()));
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat("dd-MM-yyyy").format(DateTime.now()),
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
                  ))
            ],
          ),
          16.0.height,
          WidgetInputText(
            title: "Deskripsi",
            hintText: "Masukan Deskripsi",maxLine: 5,
          ),
          16.0.height,
          WidgetButton(title: "Ubah", onTap: () {})
        ],
      ),
    );
  }
}
