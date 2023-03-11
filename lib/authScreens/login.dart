// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/viewScreens/homeScreen.dart';
import 'package:get/get.dart';
import '../Constants/color.dart';
import '../Widgets/conBtn.dart';
import '../Widgets/textFormField.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
            ),
            Text(
              "Hello",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp),
            ),
            Text(
              "Login to your accunt",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormFieldW(
              hintText: "Email",
              prefixIcon: const Icon(
                Icons.mail,
                color: orangeClr,
              ),
            ),
            TextFormFieldW(
              obscure: hidePassword,
              hintText: "Password",
              prefixIcon: const Icon(
                Icons.lock,
                color: orangeClr,
              ),
              /*  sufixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: hidePassword
                    ? const Icon(
                        Icons.visibility_off,
                        color: orangeClr,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: orangeClr,
                      ),
              ), */
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text(
                "forget your password?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => const HomeScreen());
                },
                child: ContBtn(
                  btnText: "Login",
                )),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
