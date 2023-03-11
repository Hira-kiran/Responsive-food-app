// ignore_for_file: file_names, unused_local_variable

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../Services/card_Provider.dart';
import '../Services/getProductApi.dart';
import '../Widgets/card.dart';
import '../Widgets/conBtn.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ProductApi productApi = ProductApi();
    final card = Provider.of<CardProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: Colors.orange,
          title: const Text("My products"),
          actions: [
            Padding(
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
          ],
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder(
              future: productApi.getThingsApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 1,
                      children: List.generate(10, (index) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade200,
                            child: CardW(
                              dellIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete),
                              ),
                              addicon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              removeicon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove,
                                ),
                              ),
                            ));
                      }));
                } else {
                  return GridView.count(
                      crossAxisCount: 1,
                      children: List.generate(card.counter, (index) {
                        return CardW(
                          productName: snapshot.data!.data![index].productName
                              .toString(),
                          discription: snapshot
                              .data!.data![index].categoriesName
                              .toString(),
                          rate: snapshot.data!.data![index].rate.toString(),
                          dellIcon: IconButton(
                            onPressed: () {
                              card.removeCounter();
                              card.removeTotalPrice(double.parse(
                                snapshot.data!.data![index].rate.toString(),
                              ));
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          addicon: IconButton(
                            onPressed: () {
                              
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          removeicon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                        );
                      }));
                }
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer<CardProvider>(
            builder: (context, value, child) {
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                    ? false
                    : true,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                        Text(
                          value.getTotalPrice().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(
            color: Colors.grey,
            height: 45.h,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ContBtn(
            btnText: "CHECKOUT",
          ),
          SizedBox(
            height: 20.h,
          ),
        ]));
  }
}
