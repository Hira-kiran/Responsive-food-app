// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../Services/card_Provider.dart';
import '../Services/getProductApi.dart';
import '../Widgets/containerPh.dart';

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    ProductApi productApi = ProductApi();
    final card = Provider.of<CardProvider>(context, listen: true);

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
                    onPressed: () async {
                      await productApi.getThingsApi().then((value) {
                        print("Product is added to card");
                        card.addTotalPrice(double.parse(
                            snapshot.data!.data![index].rate.toString()));
                        card.addCounter();
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      });
                    },
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
