// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foodapp/Widgets/containerPh.dart';
import 'package:shimmer/shimmer.dart';

import '../Services/getProductApi.dart';

class PizzaT extends StatefulWidget {
  const PizzaT({super.key});

  @override
  State<PizzaT> createState() => _PizzaTState();
}

class _PizzaTState extends State<PizzaT> {
  @override
  Widget build(BuildContext context) {
    // final card = Provider.of<CardProvider>(context);
    ProductApi productApi = ProductApi();
    return FutureBuilder(
      future: productApi.getThingsApi(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return GridView.count(
              crossAxisCount: 4,
              children: List.generate(10, (index) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade200,
                    child: ContainerPh());
              }));
        } else {
          return GridView.count(
              crossAxisCount: 4,
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
