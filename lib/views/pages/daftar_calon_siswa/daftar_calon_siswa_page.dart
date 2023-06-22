import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/daftar_calon_siswa/widget_daftar_calon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DaftarCalonSiswaPage extends StatefulWidget {
  DaftarCalonSiswaPage({super.key});

  @override
  State<DaftarCalonSiswaPage> createState() => _DaftarCalonSiswaPageState();
}

class _DaftarCalonSiswaPageState extends State<DaftarCalonSiswaPage> {
  final PendaftaranController pendaftaranController =
      Get.isRegistered() ? Get.find() : Get.put(PendaftaranController());

  @override
  void initState() {
    pendaftaranController.getListPendaftaran();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Daftar Calon Siswa Baru',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
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
