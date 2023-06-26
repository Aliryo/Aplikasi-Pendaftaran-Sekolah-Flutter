import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';

class Helper {
  static String jadwalImage(int fase) {
    switch (fase) {
      case 1:
        return AppImages.step1;
      case 2:
        return AppImages.step2;
      case 3:
        return AppImages.step3;
      case 4:
        return AppImages.step4;
      default:
        return AppImages.step1;
    }
  }
}
