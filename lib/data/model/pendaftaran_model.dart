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
  bool? pembayaran;
  bool? status;
  String? descStatus;

  PendaftaranModel({
    this.id,
    this.namaLengkap,
    this.tanggalLahir,
    this.tempatLahir,
    this.alamat,
    this.pembayaran,
    this.status,
    this.descStatus,
  });

  PendaftaranModel copyWith({
    String? id,
    String? namaLengkap,
    String? tanggalLahir,
    String? tempatLahir,
    String? alamat,
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
        pembayaran: json["pembayaran"],
        status: json["status"],
        descStatus: json["descStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "tanggal_lahir": tanggalLahir,
        "tempat_lahir": tempatLahir,
        "alamat": alamat,
        "pembayaran": pembayaran,
        "status": status,
        "descStatus": descStatus,
      };
}
