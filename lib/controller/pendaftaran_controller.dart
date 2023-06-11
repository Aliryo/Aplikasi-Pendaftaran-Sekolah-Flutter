import 'dart:io';

import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/pendaftaran_service.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/pendaftaran/pembayaran_page.dart';
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

  Rx<File> fotoDiri = File('').obs;
  Rx<File> aktaKelahiran = File('').obs;
  var isValid = false.obs;

  Rx<File> buktiPembayaran = File('').obs;
  RxString fotoDiriImageUrl = ''.obs;
  RxString fotoAktaKelahiranImageUrl = ''.obs;
  RxString fotoBuktiPembayaranImageUrl = ''.obs;
  // final _picker = ImagePicker();

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
  }

  // Future<void> upladFotoDiri() async {
  //   final XFile? imageFile =
  //       await _picker.pickImage(source: ImageSource.camera);
  //   if (imageFile != null) {
  //     final String downloadURL =
  //         await PendaftaranService().uploadFotoDiri(imageFile, 'fotodiri');
  //     fotoDiriImageUrl.value = downloadURL;
  //   }
  // }

  // Future<void> pickFotoAktaKelahiran() async {
  //   final XFile? imageFile =
  //       await _picker.pickImage(source: ImageSource.camera);
  //   if (imageFile != null) {
  //     final String downloadURL =
  //         await PendaftaranService().uploadFotoDiri(imageFile, 'aktakelahiran');
  //     fotoAktaKelahiranImageUrl.value = downloadURL;
  //   }
  // }

  // Future<void> pickFotoBuktiPembayaran() async {
  //   final XFile? imageFile =
  //       await _picker.pickImage(source: ImageSource.camera);
  //   if (imageFile != null) {
  //     final String downloadURL = await PendaftaranService()
  //         .uploadFotoDiri(imageFile, 'buktipembayaran');
  //     fotoBuktiPembayaranImageUrl.value = downloadURL;
  //   }
  // }

  validatePendaftaran() {}

  Future addPendaftarBaru() async {
    try {
      isPendaftaranLoading.value = true;

      if (fotoDiri.value.path.isNotEmpty &&
          aktaKelahiran.value.path.isNotEmpty) {
        final String fotoDiriURL = await PendaftaranService()
            .uploadFotoDiri(fotoDiri.value, 'fotodiri');
        final String aktaKelahiranURL = await PendaftaranService()
            .uploadFotoDiri(aktaKelahiran.value, 'aktakelahiran');
        await PendaftaranService().addPendaftaran(
          namaLengkap: namaLengkapController.text,
          tanggalLahir: tanggalLahirController.text,
          tempatLahir: tempatLahirController.text,
          alamat: alamatController.text,
          fotoDiri: fotoDiriURL,
          aktaKelahiran: aktaKelahiranURL,
          buktiPembayaran: '',
          pembayaran: false,
          status: false,
          descStatus: '',
        );
      }

      Get.to(() => PembayaranPage());
      GetStorage().write('sudahDaftar', true);
      namaLengkapController.clear();
      tanggalLahirController.clear();
      tempatLahirController.clear();
      alamatController.clear();

      fotoDiri.value = File('');
      aktaKelahiran.value = File('');

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
    tanggalLahirController.clear();
    tempatLahirController.clear();
    alamatController.clear();
    fotoDiri.value = File('');
    aktaKelahiran.value = File('');
    buktiPembayaran.value = File('');
    super.onClose();
  }
}
