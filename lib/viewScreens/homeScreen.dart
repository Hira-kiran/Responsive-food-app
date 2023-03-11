// ignore_for_file: file_names

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/viewScreens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../CaragariedTab/burgerTab.dart';
import '../CaragariedTab/macroni.dart';
import '../CaragariedTab/pasta.dart';
import '../CaragariedTab/pizzaTab.dart';
import '../CatagariesPh/burger.dart';
import '../CatagariesPh/macroni.dart';
import '../CatagariesPh/pasta.dart';
import '../CatagariesPh/pizza.dart';
import '../Constants/color.dart';
import '../Services/card_Provider.dart';
import '../Widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    // final card = Provider.of<CardProvider>(context);
    // ProductApi? productApi = ProductApi();

    return Scaffold(
      drawer: const DrawerW(),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: orangeClr,
        title: const Text("E-Commerce App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                child: Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  alignment: Alignment.center,
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeColor: Colors.red,
                  badgeContent: Consumer<CardProvider>(
                    builder: (context, value, child) {
                      return Text(
                        value.getCounter().toString(),
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600.0) {
          // For Mobile phone
          return Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelColor: blackClr,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                      indicator: BoxDecoration(
                          color: orangeClr,
                          borderRadius: BorderRadius.circular(20.r)),
                      tabs: const [
                        Tab(
                            child: Text(
                          "Pizza",
                        )),
                        Tab(
                            child: Text(
                          "Burger",
                        )),
                        Tab(
                            child: Text(
                          "Macroni",
                        )),
                        Tab(
                            child: Text(
                          "Pasta",
                        )),
                      ]),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: TabBarView(controller: tabController, children: const [
                  // ****************For Mobile phone******************
                  Pizza(),
                  Burger(),
                  Macroni(),
                  Pasta(),
                ]),
              )
            ],
          );
        } else {
          // For Tablet
          return Column(children: [
            SizedBox(
              height: 10.h,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r)),
                child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelColor: blackClr,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                    indicator: BoxDecoration(
                        color: orangeClr,
                        borderRadius: BorderRadius.circular(20.r)),
                    tabs: const [
                      Tab(
                          child: Text(
                        "Pizza",
                      )),
                      Tab(
                          child: Text(
                        "Burger",
                      )),
                      Tab(
                          child: Text(
                        "Macroni",
                      )),
                      Tab(
                          child: Text(
                        "Pasta",
                      )),
                    ]),
              ),
            ),
            Expanded(
              // *************For Tablet*******************
              child: TabBarView(
                controller: tabController,
                children: const [PizzaT(), BurgerT(), MacroniT(), PastaT()],
              ),
            )
          ]);
        }
      }),
    );
  }
}
