// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/color.dart';

class ContBtn extends StatelessWidget {
  String? btnText;
  ContBtn({super.key, this.btnText});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55.h,
        width: 330.w,
        decoration: BoxDecoration(
            color: orangeClr, borderRadius: BorderRadius.circular(30.r)),
        child: Center(
          child: Text(btnText.toString(),
              style: TextStyle(
                  color: whiteClr,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp)),
        ));
  }
}
