import 'dart:developer';

import 'package:aplikasi_pendaftaran_siswa/data/model/jadwal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JadwalService {
  final _jadwal = FirebaseFirestore.instance.collection('jadwal');

  Future addJadwal({
    required String fase,
    required String title,
    required String beginAt,
    required String endAt,
    required String deskripsi,
  }) {
    return _jadwal.add({
      'fase': fase,
      'title': title,
      'begin_at': beginAt,
      'end_at': endAt,
      'desc': deskripsi,
    });
  }

  Future updateJadwal({
    required String id,
    required int fase,
    required String judul,
    required String startDate,
    required String endDate,
    required String desrkipsi,
  }) {
    return _jadwal.doc(id).update({
      'fase': fase,
      'title': judul,
      'begin_at': startDate,
      'end_at': endDate,
      'desc': desrkipsi,
    });
  }

  Future deleteJadwal(String docId) {
    return _jadwal.doc(docId).delete();
  }

  Future<List<JadwalModel>> getJadwals() async {
    try {
      QuerySnapshot result = await _jadwal.get();

      log("result $result");
      List<JadwalModel> jadwal = result.docs
          .map(
            (e) => JadwalModel.fromJson(e.data() as Map<String, dynamic>)
                .copyWith(id: e.id),
          )
          .toList();
      return jadwal;
    } catch (e) {
      rethrow;
    }
  }
}
