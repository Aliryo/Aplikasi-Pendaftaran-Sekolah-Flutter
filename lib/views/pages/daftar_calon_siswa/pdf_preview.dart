import 'package:aplikasi_pendaftaran_siswa/controller/pendaftaran_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage(
      {Key? key, required this.pendaftaran, required this.controller})
      : super(key: key);
  final PendaftaranController controller;
  final PendaftaranModel pendaftaran;
  @override
  Widget build(BuildContext context) {
    String color = pendaftaran.status == 'Diproses'
        ? '2561FC'
        : pendaftaran.status == 'Ditolak'
            ? 'FF2525'
            : '2AD350';
    return Scaffold(
      appBar:  AppBar(
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
              'PDF Preview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: PdfPreview(
        build: (context) => controller.makePdf(pendaftaran, color),
      ),
    );
  }
}
