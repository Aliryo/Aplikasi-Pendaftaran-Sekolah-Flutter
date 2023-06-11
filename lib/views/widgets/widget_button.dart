// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class WidgetButton extends StatelessWidget {
//   const WidgetButton(
//       {super.key, required this.title, this.onTap, this.color = Colors.green});
//   final Color color;
//   final String title;
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.h),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    super.key,
    required this.title,
    this.height = 54,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    required this.onTap,
    this.disable = false,
    this.color = Colors.green,
    this.icon,
    this.loading = false,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Function() onTap;
  final Color color;
  final bool disable;
  final bool loading;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.h,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: disable ? Colors.grey : color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r))),
        onPressed: disable || loading ? () {} : onTap,
        child: loading
            ? Padding(
                padding: EdgeInsets.all(8.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  icon != null ? 8.0.width : 0.0.width,
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
