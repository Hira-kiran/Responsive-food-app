// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/Constants/color.dart';
import 'package:get/get.dart';
import '../Widgets/conBtn.dart';
import '../Widgets/textFormField.dart';
import '../viewScreens/homeScreen.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Text(
            "Create Account",
            style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30.h,
          ),
          Column(
            children: [
              TextFormFieldW(
                hintText: "Email",
                prefixIcon: const Icon(
                  Icons.mail,
                  color: orangeClr,
                ),
              ),
              TextFormFieldW(
                hintText: "Phone",
                prefixIcon: const Icon(
                  Icons.phone,
                  color: orangeClr,
                ),
              ),
              TextFormFieldW(
                obscure: true,
                hintText: "Password",
                prefixIcon: const Icon(
                  Icons.lock,
                  color: orangeClr,
                ),
              ),
              TextFormFieldW(
                obscure: true,
                hintText: "Confirm Password",
                prefixIcon: const Icon(
                  Icons.lock,
                  color: orangeClr,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const HomeScreen());
                  },
                  child: ContBtn(
                    btnText: "Sign Up",
                  )),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
