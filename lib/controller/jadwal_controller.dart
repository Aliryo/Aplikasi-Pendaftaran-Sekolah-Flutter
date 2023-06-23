import 'dart:developer';

import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/jadwal_service.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  var isLoading = false.obs;
  var jadwals = <JadwalModel>[].obs;
  @override
  void onInit() {
    getJadwal();
    super.onInit();
  }

  Future<void> getJadwal() async {
    try {
      jadwals.clear();
      isLoading.value = true;
      var data = await JadwalService().getJadwals();
      data.sort((a,b)=> a.fase!.compareTo(b.fase!));
      jadwals.assignAll(data);
      log("Data Jadwal => ${jadwals.value}");
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
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
