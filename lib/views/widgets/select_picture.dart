import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectPicture extends StatelessWidget {
  const SelectPicture({super.key, this.galeryTap, this.cameraTap});
  final Function()? galeryTap;
  final Function()? cameraTap;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: 900.w,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r))),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Pilih Pengambilan Gambar',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close,
                  size: 24.h,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: galeryTap,
            child: Row(
              children: [
                Icon(
                  Icons.browse_gallery_rounded,
                  size: 24.w,
                  color: Colors.green,
                ),
                8.0.width,
                Text(
                  "Dari Gallery",
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
          ),
          16.0.height,
          GestureDetector(
            onTap: cameraTap,
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 24.w,
                  color: Colors.green,
                ),
                8.0.width,
                Text(
                  "Dari Kamera",
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
          ),
        ],
      );
    }

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: header(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      content: content(),
      contentPadding: EdgeInsets.all(16.w),
    );
  }
}
