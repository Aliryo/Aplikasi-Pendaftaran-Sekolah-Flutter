import 'dart:developer';
import 'dart:io';
import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/pendaftaran_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class PendaftaranController extends GetxController {
  final namaLengkapController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final alamatController = TextEditingController();

  var isGetLoading = false.obs;
  var isPendaftaranLoading = false.obs;
  var pendaftaranModel = PendaftaranModel().obs;
  var imagePath = ''.obs;
  var listPendaftaran = <PendaftaranModel>[].obs;

  Rx<File> fotoDiri = File('').obs;
  Rx<File> aktaKelahiran = File('').obs;
  Rx<File> buktiPembayaran = File('').obs;
  var selectedDate = DateTime.now().obs;

  var pendaftaraninValid = true.obs;

  var penbayaraninValid = true.obs;
  // final _picker = ImagePicker();

  // @override
  // void onInit() {
  //   getListPendaftaran();
  //   super.onInit();
  // }

  setSelectedDate(DateTime value) => selectedDate.value = value;
  Future camera({required String type, bool fromGalery = false}) async {
    final pickedImage = await ImagePicker().pickImage(
        imageQuality: 88,
        source: fromGalery ? ImageSource.gallery : ImageSource.camera,
        preferredCameraDevice: CameraDevice.front);

    if (pickedImage != null) {
      if (type == "Selfie") {
        fotoDiri.value = File(pickedImage.path);
      } else if (type == "Akta") {
        aktaKelahiran.value = File(pickedImage.path);
      } else {
        buktiPembayaran.value = File(pickedImage.path);
      }
    }
    validatePendaftaran();
    validatePembayaran();
  }

  onNameChange(String value) {
    validatePendaftaran();
  }

  onTanggalChange(String value) {
    validatePendaftaran();
  }

  onTempatChange(String value) {
    validatePendaftaran();
  }

  onAlamatChange(String value) {
    validatePendaftaran();
  }

  validatePendaftaran() {
    if (namaLengkapController.text != "" &&
        tempatLahirController.text != "" &&
        alamatController.text != '' &&
        fotoDiri.value.path.isNotEmpty &&
        aktaKelahiran.value.path.isNotEmpty) {
      pendaftaraninValid.value = false;
    } else {
      pendaftaraninValid.value = true;
    }
  }

  validatePembayaran() {
    if (buktiPembayaran.value.path.isNotEmpty) {
      penbayaraninValid.value = false;
    } else {
      penbayaraninValid.value = true;
    }
  }

  Future<void> getListPendaftaran() async {
    try {
      listPendaftaran.clear();
      isGetLoading.value = true;
      var data = await PendaftaranService().getPendaftarans();
      listPendaftaran.assignAll(data);
      log("Data Pendaftaran => ${listPendaftaran.value}");
      isGetLoading.value = false;
    } catch (e) {
      isGetLoading.value = false;
    }
  }

  Future addPendaftarBaru() async {
    try {
      isPendaftaranLoading.value = true;

      if (fotoDiri.value.path.isNotEmpty &&
          aktaKelahiran.value.path.isNotEmpty) {
        final String fotoDiriURL = await PendaftaranService()
            .uploadFotoDiri(fotoDiri.value, 'fotodiri');
        final String aktaKelahiranURL = await PendaftaranService()
            .uploadFotoDiri(aktaKelahiran.value, 'aktakelahiran');
        final String buktiPembayaranURL = await PendaftaranService()
            .uploadFotoDiri(buktiPembayaran.value, 'buktipembayaran');
        await PendaftaranService().addPendaftaran(
          namaLengkap: namaLengkapController.text,
          tanggalLahir: selectedDate.value.toIso8601String(),
          tempatLahir: tempatLahirController.text,
          alamat: alamatController.text,
          fotoDiri: fotoDiriURL,
          aktaKelahiran: aktaKelahiranURL,
          buktiPembayaran: buktiPembayaranURL,
          status: "Diproses",
          descStatus: '',
        );
      }
      GetStorage().write('sudahDaftar', true);
      namaLengkapController.clear();
      selectedDate.value = DateTime.now();
      tempatLahirController.clear();
      alamatController.clear();
      fotoDiri.value = File('');
      aktaKelahiran.value = File('');
      Get.close(2);
      Get.snackbar("Berhasil", "Pendaftaran berhasil",
          backgroundColor: Colors.blueAccent, colorText: Colors.white);
      isPendaftaranLoading.value = false;
    } catch (e) {
      isPendaftaranLoading.value = false;
      Get.snackbar('Gagal', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      throw Exception(e.toString());
    }
  }

  @override
  void onClose() {
    namaLengkapController.clear();
    selectedDate.value = DateTime.now();
    tempatLahirController.clear();
    alamatController.clear();
    fotoDiri.value = File('');
    aktaKelahiran.value = File('');
    buktiPembayaran.value = File('');
    super.onClose();
  }
}
