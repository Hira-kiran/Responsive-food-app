// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldW extends StatelessWidget {
  String? hintText;
  Icon? prefixIcon;
  IconButton? sufixIcon;
  bool obscure;
  TextEditingController? editingController;

  TextFormFieldW(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.editingController,
      this.sufixIcon,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        // height: 100.h,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 225, 221, 221),
            blurRadius: 25,
          )
        ]),
        child: TextFormField(
          obscureText: obscure,
          controller: editingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.r)),
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              prefixIcon: prefixIcon,
              suffix: sufixIcon),
        ),
      ),
    );
  }
}
