// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/color.dart';

class CardW extends StatefulWidget {
  String? productName;
  String? discription;
  String? count;
  String? rate;
  IconButton addicon;
  IconButton removeicon;
  IconButton dellIcon;
  CardW(
      {super.key,
      this.productName,
      this.discription,
      this.count,
      this.rate,
      required this.dellIcon,
      required this.addicon,
      required this.removeicon});

  @override
  State<CardW> createState() => _CardWState();
}

class _CardWState extends State<CardW> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 105.h,
        width: 340.w,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: greyClr, blurRadius: 5, offset: Offset(-1, 1))
        ], color: whiteClr, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: Text(
                        widget.productName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Text(
                        widget.discription.toString(),
                        style: TextStyle(color: greyClr, fontSize: 12.sp),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: Text(
                        widget.rate.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
                /* SizedBox(
                  width: 130.w,
                ), */
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    IconButton(onPressed: () {}, icon: widget.dellIcon),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 35.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          color: orangeClr,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: widget.addicon,
                            color: Colors.white,
                            iconSize: 18,
                          ),
                          Text(
                            widget.count.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: widget.removeicon,
                            iconSize: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
