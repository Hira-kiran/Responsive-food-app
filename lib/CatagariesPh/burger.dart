// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:foodapp/Widgets/containerPh.dart';
import 'package:shimmer/shimmer.dart';

import '../Services/getProductApi.dart';

class Burger extends StatefulWidget {
  const Burger({super.key});

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    ProductApi productApi = ProductApi();
    return FutureBuilder(
      future: productApi.getThingsApi(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade200,
                    child: ContainerPh());
              }));
        } else {
          return GridView.count(
              crossAxisCount: 2,
              children: List.generate(snapshot.data!.data!.length, (index) {
                return ContainerPh(
                  productName:
                      snapshot.data!.data![index].productName.toString(),
                  categories:
                      snapshot.data!.data![index].categoriesName.toString(),
                  rate: snapshot.data!.data![index].rate.toString(),
                  iconButton: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                );
              }));
        }
      },
    );
  }
}
