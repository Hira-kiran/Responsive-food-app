// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/color.dart';

class DrawerW extends StatelessWidget {
  const DrawerW({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: orangeClr),
              currentAccountPicture: const CircleAvatar(),
              accountName: Text(
                "Hira kiran",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text("hirakiran@gmail.com")),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favroite"),
          ),
          const ListTile(
            leading: Icon(Icons.rate_review),
            title: Text("Rate us"),
          ),
          const ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 1,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.privacy_tip_sharp),
            title: Text("Privacy policy"),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
