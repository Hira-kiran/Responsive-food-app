// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/color.dart';

class ContainerPh extends StatelessWidget {
  String? productName;
  String? categories;
  String? rate;
  IconButton? iconButton;
  double height;
  double width;
  ContainerPh(
      {super.key,
      this.productName,
      this.categories,
      this.rate,
      this.iconButton,
      this.height = 120,
      this.width = 155});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height.h,
        width: width.w,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: greyClr, blurRadius: 2, offset: Offset(-1, 1))
          ],
          color: Color.fromARGB(255, 248, 221, 180),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                productName.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
            ),
            Center(
              child: Text(
                categories.toString(),
                style: TextStyle(color: greyClr, fontSize: 14.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rate.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                  ),
                  Container(
                      height: 30.h,
                      width: 30.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: orangeClr,
                      ),
                      child: Center(child: iconButton))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
