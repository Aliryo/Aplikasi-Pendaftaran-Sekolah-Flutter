import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlertDitolak extends StatelessWidget {
  AlertDitolak({super.key, required this.id});
  final PendaftaranController pendaftaranController = Get.find();
  final String id;
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        width: 900.w,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r))),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: const Text(
            'Alasan tidak lolos',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Silahkan masukan alasan kenapa calon siswa tidak diterima',
            textAlign: TextAlign.center,
          ),
          32.0.height,
          const Text('Alasan'),
          8.0.height,
          Container(
            color: const Color(0xffE4EDFF),
            child: TextFormField(
              controller: pendaftaranController.descController,
              maxLines: 6,
              cursorColor: Theme.of(context).indicatorColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorHeight: 18,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
          32.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: WidgetButton(
                onTap: () {
                  Get.back();
                },
                title: 'Batal',
              )),
              16.0.width,
              Expanded(
                  child: WidgetButton(
                onTap: () {
                  pendaftaranController.updatePendaftaran(
                      status: "Ditolak", id: id);
                  Get.close(1);
                },
                title: 'Konfirmasi',
                color: Colors.red,
              )),
            ],
          )
        ],
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: AlertDialog(
        titlePadding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: title(),
        content: content(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }
}
