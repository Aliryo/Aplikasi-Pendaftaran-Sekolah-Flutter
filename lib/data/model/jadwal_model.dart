import 'dart:convert';

JadwalModel pendaftaranModelFromJson(String str) =>
    JadwalModel.fromJson(json.decode(str));

String pendaftaranModelToJson(JadwalModel data) => json.encode(data.toJson());

class JadwalModel {
  String? id;
  int? fase;
  String? title;
  DateTime? beginAt;
  DateTime? endAt;
  String? deskripsi;

  JadwalModel({
    this.id,
    this.fase,
    this.title,
    this.beginAt,
    this.endAt,
    this.deskripsi,
  });

  JadwalModel copyWith({
    String? id,
    int? fase,
    String? title,
    DateTime? beginAt,
    DateTime? endAt,
    String? deskripsi,
  }) =>
      JadwalModel(
        id: id ?? this.id,
        fase: fase ?? this.fase,
        title: title ?? this.title,
        beginAt: beginAt ?? this.beginAt,
        endAt: endAt ?? this.endAt,
        deskripsi: deskripsi ?? this.deskripsi,
      );

  factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
      id: json['id'],
      fase: json['fase'],
      title: json['title'],
      beginAt:DateTime.parse(json['begin_at']) ,
      endAt: DateTime.parse(json['end_at']),
      deskripsi: json['desc']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'fase': fase,
        'title': title,
        'begin_at': beginAt?.toIso8601String(),
        'end_at': endAt?.toIso8601String(),
        'desc': deskripsi,
      };
}
