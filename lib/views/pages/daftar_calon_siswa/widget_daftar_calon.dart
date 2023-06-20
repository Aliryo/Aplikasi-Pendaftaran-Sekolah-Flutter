import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/daftar_calon_siswa/detail_calon_siswa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WidgetDaftarCalon extends StatelessWidget {
  const WidgetDaftarCalon({
    super.key,
    required this.pendaftaran,
  });
  final PendaftaranModel pendaftaran;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailCalonSiswaPage(pendaftaran: pendaftaran));
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                pendaftaran.selfieUrl ?? "",
                width: 70.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            16.0.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (pendaftaran.namaLengkap ?? "").capitalize!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                  4.0.height,
                  Text(
                    "${(pendaftaran.tempatLahir ?? '').capitalize},  ${DateFormat("dd MMMM yyyy").format(pendaftaran.tanggalLahir ?? DateTime.now())}",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  4.0.height,
                  Text(
                    pendaftaran.alamat ?? "",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // 16.0.width,
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(16.r),
            //   child: Container(
            //     padding: EdgeInsets.all(12.w),
            //     color: (pendaftaran.status??false) ? Colors.green : Colors.blue,
            //     child: Text(
            //   (pendaftaran.status??false) ? 'Diterima' : 'Diproses',
            //       style: const TextStyle(
            //         fontSize: 12,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
