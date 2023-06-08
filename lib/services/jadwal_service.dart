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

  Future updateJadwal(JadwalModel jadwalModel) {
    return _jadwal.doc(jadwalModel.id).update({
      'fase': jadwalModel.fase,
      'title': jadwalModel.title,
      'begin_at': jadwalModel.beginAt,
      'end_at': jadwalModel.endAt,
      'desc': jadwalModel.deskripsi,
    });
  }

  Future deleteJadwal(String docId) {
    return _jadwal.doc(docId).delete();
  }
}
