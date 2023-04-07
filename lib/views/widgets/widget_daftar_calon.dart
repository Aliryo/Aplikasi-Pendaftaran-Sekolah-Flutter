import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/src/app_images.dart';

class WidgetDaftarCalon extends StatelessWidget {
  const WidgetDaftarCalon(
      {super.key,
      required this.name,
      required this.birth,
      required this.address,
      required this.accepted,
      this.onTap});
  final String name;
  final String birth;
  final String address;
  final bool accepted;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                AppImages.bocil,
                width: 60.w,
              ),
            ),
            16.0.width,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  2.0.height,
                  Text(
                    birth,
                  ),
                  4.0.height,
                  Text(
                    address,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            16.0.width,
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                padding: EdgeInsets.all(12.w),
                color: accepted ? Colors.green : Colors.blue,
                child: Text(
                  accepted ? 'Diterima' : 'Diproses',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
