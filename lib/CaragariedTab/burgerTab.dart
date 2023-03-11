// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foodapp/Services/getProductApi.dart';
import 'package:shimmer/shimmer.dart';
import '../Widgets/containerPh.dart';

class BurgerT extends StatefulWidget {
  const BurgerT({super.key});

  @override
  State<BurgerT> createState() => _BurgerTState();
}

class _BurgerTState extends State<BurgerT> {
  @override
  Widget build(BuildContext context) {
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
