import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PendaftaranService {
  String _uid = '';

  PendaftaranService() {
    if (FirebaseAuth.instance.currentUser != null) {
      _uid = FirebaseAuth.instance.currentUser!.uid;
    }
  }
  final _pendaftaran = FirebaseFirestore.instance.collection('pendaftaran');
  final _storage = FirebaseStorage.instance;

  Future addPendaftaran({
    required String namaLengkap,
    required String tanggalLahir,
    required String tempatLahir,
    required String alamat,
    required String fotoDiri,
    required String aktaKelahiran,
    required String buktiPembayaran,
   
    required String status,
    required String descStatus,
  }) {
    return _pendaftaran.add({
      'nama_lengkap': namaLengkap,
      'tanggal_lahir': tanggalLahir,
      'tempat_lahir': tempatLahir,
      'alamat': alamat,
      'foto_diri': fotoDiri,
      'akta_kelahiran': aktaKelahiran,
      'bukti_pembayaran': buktiPembayaran,
     
      'status': status,
      'descStatus': descStatus,
      'userId': _uid,
    });
  }

  Future<String> uploadFotoDiri(File imageFile, String title) async {
    try {
      final Reference storageRef =
          _storage.ref().child('foto_diri').child('$_uid+$title.jpg');
      final TaskSnapshot snapshot = await storageRef.putFile(imageFile);
      final String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<PendaftaranModel>> getPendaftarans() async {
    try {
      QuerySnapshot result = await _pendaftaran.get();

      List<PendaftaranModel> pendaftarans = result.docs
          .map(
            (e) => PendaftaranModel.fromJson(e.data() as Map<String, dynamic>),
          )
          .toList();

      return pendaftarans;
    } catch (e) {
      rethrow;
    }
  }
}
