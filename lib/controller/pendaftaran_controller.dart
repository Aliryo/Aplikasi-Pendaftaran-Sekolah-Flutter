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
  RxString fotoDiriImageUrl = ''.obs;
  RxString fotoAktaKelahiranImageUrl = ''.obs;
  RxString fotoBuktiPembayaranImageUrl = ''.obs;
  final _picker = ImagePicker();

  Future<void> pickFotoDiri() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final String downloadURL =
          await PendaftaranService().uploadFotoDiri(imageFile, 'fotodiri');
      fotoDiriImageUrl.value = downloadURL;
    }
  }

  Future<void> pickFotoAktaKelahiran() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final String downloadURL =
          await PendaftaranService().uploadFotoDiri(imageFile, 'aktakelahiran');
      fotoAktaKelahiranImageUrl.value = downloadURL;
    }
  }

  Future<void> pickFotoBuktiPembayaran() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final String downloadURL = await PendaftaranService()
          .uploadFotoDiri(imageFile, 'buktipembayaran');
      fotoBuktiPembayaranImageUrl.value = downloadURL;
    }
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
