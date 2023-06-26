import 'dart:developer';

import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/jadwal_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  var isLoading = false.obs;
  var isUpdateLodaing = false.obs;
  var isAddDisable = true.obs;
  var currentStep = 0.obs;
  var isAddLoading = false.obs;
  var jadwals = <JadwalModel>[].obs;
  var selectedJadwal = JadwalModel().obs;
  var startdate =
      DateTime.now().subtract(Duration(days: DateTime.now().day - 1)).obs;
  var endDate = DateTime.now().obs;
  var tanggalMulai =
      DateTime.now().subtract(Duration(days: DateTime.now().day - 1)).obs;
  var tanggalSelesai = DateTime.now().obs;
  var judulController = TextEditingController();
  var deskripsiController = TextEditingController();
  var judulAddController = TextEditingController();
  var deskripsiAddController = TextEditingController();
  List<int> listFase = [1, 2, 3, 4];
  var fase = 0.obs;

  @override
  void onInit() {
    getJadwal();
    super.onInit();
  }

  void changeStep(int index) => currentStep.value = index;

  void setJadwal(JadwalModel jadwal) {
    selectedJadwal.value = jadwal;
    startdate.value = jadwal.beginAt ?? DateTime.now();
    endDate.value = jadwal.endAt ?? DateTime.now();
    judulController.text = jadwal.title ?? '';
    deskripsiController.text = jadwal.deskripsi ?? '';
  }

  setSelectedFase(int index) {
    fase.value = index;
    validateDisable();
  }

  onJudulChange(String value) {
    validateDisable();
  }

  onDeskripsiChange(String value) {
    validateDisable();
  }

  setStartDate(DateTime value) => startdate.value = value;
  setEndDate(DateTime value) => endDate.value = value;

  setTanggalMulai(DateTime value) => tanggalMulai.value = value;
  setTanggalSelesai(DateTime value) => tanggalSelesai.value = value;

  Future<void> getJadwal() async {
    try {
      jadwals.clear();
      isLoading.value = true;
      var data = await JadwalService().getJadwals();
      data.sort((a, b) => a.fase!.compareTo(b.fase!));
      jadwals.assignAll(data);
      log("Data Jadwal => $jadwals");
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  validateDisable() {
    if (fase.value != 0 &&
        judulAddController.text != '' &&
        deskripsiAddController.text != '') {
      isAddDisable.value = false;
    } else {
      isAddDisable.value = true;
    }
  }

  Future<void> deleteJadwal(String id) async {
    try {
      await JadwalService().deleteJadwal(id);
      getJadwal();
      Get.snackbar("Succes", "Berhasil Menghapus Jadwal",
          backgroundColor: Colors.blue, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Gagal", "Gagal Menghapus jadwal",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> updateJadwal() async {
    try {
      isUpdateLodaing.value = true;
      await JadwalService().updateJadwal(
          id: selectedJadwal.value.id!,
          fase: selectedJadwal.value.fase!,
          judul: judulController.text,
          startDate: startdate.value.toIso8601String(),
          endDate: endDate.value.toIso8601String(),
          desrkipsi: deskripsiController.text);
      getJadwal();
      Get.snackbar("Succes", "Berhasil mengubah jadwal",
          backgroundColor: Colors.blue, colorText: Colors.white);
      Get.close(1);
      isUpdateLodaing.value = false;
    } catch (e) {
      Get.snackbar("Gagal", "Gagal mengubah jadwal",
          backgroundColor: Colors.red, colorText: Colors.white);
      isUpdateLodaing.value = false;
    }
  }

  void removeFase() {
    for (var jadwal in jadwals) {
      listFase.removeWhere((element) => element == jadwal.fase);
    }
  }

  Future<void> addJadwal() async {
    try {
      isAddLoading.value = true;
      await JadwalService().addJadwal(
          fase: fase.value,
          title: judulAddController.text,
          beginAt: tanggalMulai.value.toIso8601String(),
          endAt: tanggalSelesai.value.toIso8601String(),
          deskripsi: deskripsiAddController.text);
      getJadwal();
      Get.snackbar("Succes", "Berhasil mengubah jadwal",
          backgroundColor: Colors.blue, colorText: Colors.white);
      Get.close(1);
      judulAddController.clear();
      deskripsiAddController.clear();
      tanggalMulai.value =
          DateTime.now().subtract(Duration(days: DateTime.now().day - 1));
      tanggalSelesai.value = DateTime.now();
      isAddLoading.value = false;
    } catch (e) {
      Get.snackbar("Gagal", "Gagal menambahkan jadwal",
          backgroundColor: Colors.red, colorText: Colors.white);
      isAddLoading.value = false;
    }
  }
}
