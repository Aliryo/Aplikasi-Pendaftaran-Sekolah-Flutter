import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/daftar_calon_siswa/clear_alert.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/daftar_calon_siswa/widget_daftar_calon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DaftarCalonSiswaPage extends StatefulWidget {
  const DaftarCalonSiswaPage({super.key});

  @override
  State<DaftarCalonSiswaPage> createState() => _DaftarCalonSiswaPageState();
}

class _DaftarCalonSiswaPageState extends State<DaftarCalonSiswaPage> {
  final PendaftaranController pendaftaranController =
      Get.isRegistered() ? Get.find() : Get.put(PendaftaranController());
  final AuthController authController = Get.find();

  @override
  void initState() {
    authController.user.value.role == 'admin'
        ? pendaftaranController.getListPendaftaran()
        : pendaftaranController.getListPendaftaranUser();
    super.initState();
  }

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
              Text(
                authController.user.value.role == 'admin'
                    ? 'Daftar Calon Siswa Baru'
                    : 'Lihat Pendaftaran',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            authController.user.value.role == 'admin'
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context, builder: (context) => ClearAlert());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: const Icon(
                        Icons.delete,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        body: Obx(() {
          return pendaftaranController.isGetLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : pendaftaranController.listPendaftaran.isEmpty
                  ? const Center(
                      child: Text("Tidak Ada Data"),
                    )
                  : Column(
                      children: [
                        24.0.height,
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            itemBuilder: (context, index) => WidgetDaftarCalon(
                                pendaftaran: pendaftaranController
                                    .listPendaftaran[index]),
                            itemCount:
                                pendaftaranController.listPendaftaran.length,
                          ),
                        ),
                      ],
                    );
        }));
  }
}
