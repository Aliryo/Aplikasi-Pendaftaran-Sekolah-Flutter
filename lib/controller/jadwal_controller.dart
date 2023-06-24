import 'dart:developer';

import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/jadwal_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  var isLoading = false.obs;
  var isUpdateLodaing = false.obs;
  var jadwals = <JadwalModel>[].obs;
  var selectedJadwal = JadwalModel().obs;
  var startdate =
      DateTime.now().subtract(Duration(days: DateTime.now().day - 1)).obs;
  var endDate = DateTime.now().obs;
  var judulController = TextEditingController();
  var deskripsiController = TextEditingController();

  @override
  void onInit() {
    getJadwal();
    super.onInit();
  }

  void setJadwal(JadwalModel jadwal) {
    selectedJadwal.value = jadwal;
    startdate.value = jadwal.beginAt ?? DateTime.now();
    endDate.value = jadwal.endAt ?? DateTime.now();
    judulController.text = jadwal.title ?? '';
    deskripsiController.text = jadwal.deskripsi ?? '';
  }

  setStartDate(DateTime value) => startdate.value = value;
  setEndDate(DateTime value) => endDate.value = value;

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
      isUpdateLodaing.value = false;
    }
  }
  // Future<void> addJadwal() async {
  //   await JadwalService().addJadwal(
  //       fase: "masuk sekolah",
  //       title: "Masuk Sekolah",
  //       beginAt: DateTime.now().toIso8601String(),
  //       endAt: DateTime.now().toIso8601String(),
  //       deskripsi: "Masuk sekolah hari pertama bagi para peserta didik baru ");
  //       log("Jadwal upload");
  // }
}
