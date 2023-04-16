import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetStepper extends StatelessWidget {
  const WidgetStepper({
    super.key,
    required this.currentStep,
  });
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: (currentStep == 0) ? 40.w : 32.w,
          height: (currentStep == 0) ? 40.w : 32.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (currentStep >= 0) ? Colors.green : Colors.grey),
          child: Center(
            child: Text(
              "1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (currentStep == 0) ? 14.sp : 12.sp),
            ),
          ),
        ),
        Container(
          width: 30.w,
          height: 3.w,
          color: (currentStep >= 1) ? Colors.green : Colors.grey,
        ),
        Container(
          width: (currentStep == 1) ? 40.w : 32.w,
          height: (currentStep == 1) ? 40.w : 32.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (currentStep >= 1) ? Colors.green : Colors.grey),
          child: Center(
            child: Text(
              "2",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (currentStep == 0) ? 14.sp : 12.sp),
            ),
          ),
        ),
        Container(
          width: 30.w,
          height: 3.w,
          color: (currentStep >= 2) ? Colors.green : Colors.grey,
        ),
        Container(
          width: (currentStep == 2) ? 40.w : 32.w,
          height: (currentStep == 2) ? 40.w : 32.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (currentStep >= 2) ? Colors.green : Colors.grey),
          child: Center(
            child: Text(
              "3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (currentStep == 0) ? 14.sp : 12.sp),
            ),
          ),
        ),
      ],
    );
  }
}
