import 'dart:io';

import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/pendaftaran_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class PendaftaranController extends GetxController {
  final namaLengkapController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final alamatController = TextEditingController();

  var isPendaftaranLoading = false.obs;
  var pendaftaranModel = PendaftaranModel().obs;
  var imagePath = ''.obs;
  Rx<File> image = File('').obs;
  final _picker = ImagePicker();

  Future<void> getImageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      imagePath.value = pickedFile.path;
      update();
    } else {}
  }

  Future<void> getImageGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      imagePath.value = pickedFile.path;
      update();
    } else {}
  }

  Future addPendaftarBaru() async {
    try {
      isPendaftaranLoading.value = true;
      await PendaftaranService().addPendaftaran(
        namaLengkap: namaLengkapController.text,
        tanggalLahir: tanggalLahirController.text,
        tempatLahir: tempatLahirController.text,
        alamat: alamatController.text,
        pembayaran: false,
        status: false,
        descStatus: '',
      );
      isPendaftaranLoading.value = false;
      Get.snackbar(
        'Berhasil',
        'Selamat anda berhasil daftar',
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
      );
      GetStorage().write('sudahDaftar', true);
      namaLengkapController.clear();
      tanggalLahirController.clear();
      tempatLahirController.clear();
      alamatController.clear();
    } catch (e) {
      isPendaftaranLoading.value = false;
      Get.snackbar('Gagal', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      throw Exception(e.toString());
    }
  }
}
