import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PendaftaranService {
  String _uid = '';

  PendaftaranService() {
    if (FirebaseAuth.instance.currentUser != null) {
      _uid = FirebaseAuth.instance.currentUser!.uid;
    }
  }
  final _pendaftaran = FirebaseFirestore.instance.collection('pendaftaran');

  Future addPendaftaran({
    required String namaLengkap,
    required String tanggalLahir,
    required String tempatLahir,
    required String alamat,
    required bool pembayaran,
    required bool status,
    required String descStatus,
  }) {
    return _pendaftaran.add({
      'nama_lengkap': namaLengkap,
      'tanggal_lahir': tanggalLahir,
      'tempat_lahir': tempatLahir,
      'alamat': alamat,
      'pembayaran': pembayaran,
      'status': status,
      'descStatus': descStatus,
      'userId': _uid,
    });
  }
}
