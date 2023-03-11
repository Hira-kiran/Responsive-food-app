import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'Services/card_Provider.dart';
import 'authScreens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardProvider(),
      child: Builder(builder: (context) {
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            splitScreenMode: true,
            minTextAdapt: true,
            builder: (context, child) {
              return const GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: LoginScreen(),
              );
            });
      }),
    );
  }
}
