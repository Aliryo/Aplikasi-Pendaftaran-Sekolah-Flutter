import 'dart:developer';
import 'dart:io';
import 'package:aplikasi_pendaftaran_siswa/data/model/pendaftaran_model.dart';
import 'package:aplikasi_pendaftaran_siswa/services/pendaftaran_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PendaftaranController extends GetxController {
  final namaLengkapController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final alamatController = TextEditingController();
  final statusController = TextEditingController();
  final descController = TextEditingController();

  var isGetLoading = false.obs;
  var isPendaftaranLoading = false.obs;
  var isUpdateLoading = false.obs;
  var selectedPendaftar = PendaftaranModel().obs;
  var imagePath = ''.obs;
  var listPendaftaran = <PendaftaranModel>[].obs;

  Rx<File> fotoDiri = File('').obs;
  Rx<File> aktaKelahiran = File('').obs;
  Rx<File> buktiPembayaran = File('').obs;
  var selectedDate = DateTime.now().obs;

  var pendaftaraninValid = true.obs;

  var penbayaraninValid = true.obs;
  // final _picker = ImagePicker();

  // @override
  // void onInit() {
  //   getListPendaftaran();
  //   super.onInit();
  // }

  setSelectedDate(DateTime value) => selectedDate.value = value;
  Future camera({required String type, bool fromGalery = false}) async {
    final pickedImage = await ImagePicker().pickImage(
        imageQuality: 88,
        source: fromGalery ? ImageSource.gallery : ImageSource.camera,
        preferredCameraDevice: CameraDevice.front);

    if (pickedImage != null) {
      if (type == "Selfie") {
        fotoDiri.value = File(pickedImage.path);
      } else if (type == "Akta") {
        aktaKelahiran.value = File(pickedImage.path);
      } else {
        buktiPembayaran.value = File(pickedImage.path);
      }
    }
    validatePendaftaran();
    validatePembayaran();
  }

  onNameChange(String value) {
    validatePendaftaran();
  }

  onTanggalChange(String value) {
    validatePendaftaran();
  }

  onTempatChange(String value) {
    validatePendaftaran();
  }

  onAlamatChange(String value) {
    validatePendaftaran();
  }

  validatePendaftaran() {
    if (namaLengkapController.text != "" &&
        tempatLahirController.text != "" &&
        alamatController.text != '' &&
        fotoDiri.value.path.isNotEmpty &&
        aktaKelahiran.value.path.isNotEmpty) {
      pendaftaraninValid.value = false;
    } else {
      pendaftaraninValid.value = true;
    }
  }

  validatePembayaran() {
    if (buktiPembayaran.value.path.isNotEmpty) {
      penbayaraninValid.value = false;
    } else {
      penbayaraninValid.value = true;
    }
  }

  Future<void> getListPendaftaran() async {
    try {
      listPendaftaran.clear();
      isGetLoading.value = true;
      var data = await PendaftaranService().getPendaftarans();
      listPendaftaran.assignAll(data);
      log("Data Pendaftaran => ${listPendaftaran.first.id}");
      isGetLoading.value = false;
    } catch (e) {
      isGetLoading.value = false;
    }
  }

  Future<void> getListPendaftaranUser() async {
    try {
      listPendaftaran.clear();
      isGetLoading.value = true;
      var data = await PendaftaranService().getPendaftaransUser();
      listPendaftaran.assignAll(data);
      log("Data Pendaftaran => ${listPendaftaran.first.id}");
      isGetLoading.value = false;
    } catch (e) {
      isGetLoading.value = false;
    }
  }

  Future clearPendaftaran() async {
    try {
      isGetLoading.value = true;
      await PendaftaranService().clearPendaftaran();
      await getListPendaftaran();
      Get.back();
      isGetLoading.value = false;
    } catch (e) {
      isGetLoading.value = false;
      log(e.toString());
    }
  }

  Future addPendaftarBaru() async {
    try {
      isPendaftaranLoading.value = true;

      if (fotoDiri.value.path.isNotEmpty &&
          aktaKelahiran.value.path.isNotEmpty) {
        final String fotoDiriURL = await PendaftaranService()
            .uploadFotoDiri(fotoDiri.value, 'fotodiri');
        final String aktaKelahiranURL = await PendaftaranService()
            .uploadFotoDiri(aktaKelahiran.value, 'aktakelahiran');
        final String buktiPembayaranURL = await PendaftaranService()
            .uploadFotoDiri(buktiPembayaran.value, 'buktipembayaran');
        await PendaftaranService().addPendaftaran(
          namaLengkap: namaLengkapController.text,
          tanggalLahir: selectedDate.value.toIso8601String(),
          tempatLahir: tempatLahirController.text,
          alamat: alamatController.text,
          fotoDiri: fotoDiriURL,
          aktaKelahiran: aktaKelahiranURL,
          buktiPembayaran: buktiPembayaranURL,
          status: "Diproses",
          descStatus: '',
        );
      }
      GetStorage().write('sudahDaftar', true);
      namaLengkapController.clear();
      selectedDate.value = DateTime.now();
      tempatLahirController.clear();
      alamatController.clear();
      fotoDiri.value = File('');
      aktaKelahiran.value = File('');
      Get.close(2);
      Get.snackbar("Berhasil", "Pendaftaran berhasil",
          backgroundColor: Colors.blueAccent, colorText: Colors.white);
      isPendaftaranLoading.value = false;
    } catch (e) {
      isPendaftaranLoading.value = false;
      Get.snackbar('Gagal', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      throw Exception(e.toString());
    }
  }

  Future<void> updatePendaftaran(
      {required String status, required String id}) async {
    try {
      isUpdateLoading.value = true;
      await PendaftaranService().updateStatus(
          id: id, status: status, descStatus: descController.text);
      getListPendaftaran();
      Get.snackbar("Sukses", "Berhasil mengubah status pendaftar",
          backgroundColor: Colors.blue, colorText: Colors.white);
      Get.close(1);
      isUpdateLoading.value = false;
    } catch (e) {
      isUpdateLoading.value = false;
    }
  }

  Future<Uint8List> makePdf(PendaftaranModel pendaftaran, String color) async {
    final pdf = pw.Document();
    // final imageLogo = NetworkImage(pendaftaran.selfieUrl??'');
    Uint8List profile =
        (await NetworkAssetBundle(Uri.parse(pendaftaran.selfieUrl ?? ''))
                .load(pendaftaran.selfieUrl ?? ''))
            .buffer
            .asUint8List();

    var dataImage = await rootBundle.load('assets/apklogo.jpg');
    var myImage = dataImage.buffer.asUint8List();
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a6,
      build: (context) {
        return pw.Column(children: [
          pw.Row(children: [
            pw.Expanded(
                child: pw.Column(children: [
              pw.Text(
                'SDIP Baitussalam Kuningan',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
              pw.SizedBox(height: 4.h),
              pw.Text(
                'Jl. Blok Cikedung, Kelurahan Cirendang, Kecamatan Kuningan, Kabupaten Kuningan',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontSize: 10.sp, color: PdfColors.grey800),
              ),
            ])),
            pw.SizedBox(width: 8.w),
            pw.SizedBox(
                width: 42.w,
                height: 42.w,
                child: pw.Image(pw.MemoryImage(myImage)))
          ]),
          pw.Divider(thickness: 1),
          pw.SizedBox(height: 8.h),
          pw.SizedBox(
              height: 150.h,
              width: 110.w,
              child: pw.ClipRRect(
                  horizontalRadius: 10.r,
                  verticalRadius: 10.r,
                  child:
                      pw.Image(pw.MemoryImage(profile), fit: pw.BoxFit.cover))),
          pw.SizedBox(height: 16.h),
          pw.Table(
            columnWidths: {
              0: pw.FixedColumnWidth(120.w),
              1: const pw.FlexColumnWidth(),
            },
            children: [
              pw.TableRow(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text('ID Pendaftaran',
                      style: pw.TextStyle(
                          fontSize: 12.sp, color: PdfColors.grey800)),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text((pendaftaran.id ?? '').capitalize!,
                      style: pw.TextStyle(
                          fontSize: 12.sp,
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.normal)),
                )
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text('Nama',
                      style: pw.TextStyle(
                          fontSize: 12.sp, color: PdfColors.grey800)),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text((pendaftaran.namaLengkap ?? '').capitalize!,
                      style: pw.TextStyle(
                          fontSize: 12.sp,
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.normal)),
                )
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text('Tanggal Lahir',
                      style: pw.TextStyle(
                          fontSize: 12.sp, color: PdfColors.grey800)),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text(
                      DateFormat("dd MMMM yyyy")
                          .format(pendaftaran.tanggalLahir ?? DateTime.now()),
                      style: pw.TextStyle(
                          fontSize: 12.sp,
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.normal)),
                )
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text('Tempat Lahir',
                      style: pw.TextStyle(
                          fontSize: 12.sp, color: PdfColors.grey800)),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text(
                      "${(pendaftaran.tempatLahir ?? '').capitalize}",
                      style: pw.TextStyle(
                          fontSize: 12.sp,
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.normal)),
                )
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text('Alamat',
                      style: pw.TextStyle(
                          fontSize: 12.sp, color: PdfColors.grey800)),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text(pendaftaran.alamat ?? '',
                      style: pw.TextStyle(
                          fontSize: 12.sp,
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.normal)),
                )
              ]),
              pw.TableRow(children: [
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text('Status',
                      style: pw.TextStyle(
                          fontSize: 12.sp, color: PdfColors.grey800)),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 6.h),
                  child: pw.Text(
                    pendaftaran.status ?? '',
                    style: pw.TextStyle(
                        fontSize: 12.sp,
                        color: PdfColor.fromHex(color),
                        fontWeight: pw.FontWeight.normal),
                  ),
                )
              ])
            ],
          ),
        ]);
      },
    ));
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/${pendaftaran.id}.pdf');
    await file.writeAsBytes(await pdf.save());

    return pdf.save();
  }

  @override
  void onClose() {
    namaLengkapController.clear();
    selectedDate.value = DateTime.now();
    tempatLahirController.clear();
    alamatController.clear();
    fotoDiri.value = File('');
    aktaKelahiran.value = File('');
    buktiPembayaran.value = File('');
    super.onClose();
  }
}
