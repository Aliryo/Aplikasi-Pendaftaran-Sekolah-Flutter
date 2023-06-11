import 'dart:convert';

PendaftaranModel pendaftaranModelFromJson(String str) =>
    PendaftaranModel.fromJson(json.decode(str));

String pendaftaranModelToJson(PendaftaranModel data) =>
    json.encode(data.toJson());

class PendaftaranModel {
  String? id;
  String? namaLengkap;
  String? tanggalLahir;
  String? tempatLahir;
  String? alamat;
  String? selfieUrl;
  String? aktaUrl;
  String? pembayaranUrl;
  bool? pembayaran;
  bool? status;
  String? descStatus;
  String? uid;

  PendaftaranModel({
    this.id,
    this.namaLengkap,
    this.tanggalLahir,
    this.tempatLahir,
    this.alamat,
    this.selfieUrl,
    this.aktaUrl,
    this.pembayaranUrl,
    this.pembayaran,
    this.status,
    this.descStatus,
    this.uid,
  });

  PendaftaranModel copyWith({
    String? id,
    String? namaLengkap,
    String? tanggalLahir,
    String? tempatLahir,
    String? alamat,
    String? selfieUrl,
    String? aktaUrl,
    String? pembayaranUrl,
    bool? pembayaran,
    bool? status,
    String? descStatus,
  }) =>
      PendaftaranModel(
        id: id ?? this.id,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        alamat: alamat ?? this.alamat,
        selfieUrl: selfieUrl ?? this.selfieUrl,
        aktaUrl: aktaUrl ?? this.aktaUrl,
        pembayaranUrl: pembayaranUrl ?? this.pembayaranUrl,
        pembayaran: pembayaran ?? this.pembayaran,
        status: status ?? this.status,
        descStatus: descStatus ?? this.descStatus,
      );

  factory PendaftaranModel.fromJson(Map<String, dynamic> json) =>
      PendaftaranModel(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        tanggalLahir: json["tanggal_lahir"],
        tempatLahir: json["tempat_lahir"],
        alamat: json["alamat"],
        selfieUrl: json['foto_diri'],
        aktaUrl: json['akta_kelahiran'],
        pembayaranUrl: json['bukti_pembayaran'],
        pembayaran: json["pembayaran"],
        status: json["status"],
        descStatus: json["descStatus"],
        uid: json["userId"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "tanggal_lahir": tanggalLahir,
        "tempat_lahir": tempatLahir,
        "alamat": alamat,
        'foto_diri': selfieUrl,
        "akta_kelahiran": aktaUrl,
        'bukti_pembayaran': pembayaranUrl,
        "pembayaran": pembayaran,
        "status": status,
        "descStatus": descStatus,
        'userId':uid
      };
}
