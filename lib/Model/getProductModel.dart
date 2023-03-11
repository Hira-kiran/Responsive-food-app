// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
// ignore_for_file: constant_identifier_names, unnecessary_null_comparison, unnecessary_new, file_names, prefer_conditional_assignment

import 'dart:convert';

ProductsM welcomeFromJson(String str) => ProductsM.fromJson(json.decode(str));
String welcomeToJson(ProductsM data) => json.encode(data.toJson());

class ProductsM {
  ProductsM({
    this.data,
  });

  List<ProductApiM>? data;

  factory ProductsM.fromJson(Map<String, dynamic> json) => ProductsM(
        data: List<ProductApiM>.from(
            json["data"].map((x) => ProductApiM.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductApiM {
  ProductApiM({
    this.productId,
    this.productName,
    this.rate,
    this.productImage,
    this.categoriesName,
  });

  String? productId;
  String? productName;
  String? rate;
  ProductImage? productImage;
  String? categoriesName;

  factory ProductApiM.fromJson(Map<String, dynamic> json) => ProductApiM(
        productId: json["product_id"],
        productName: json["product_name"],
        rate: json["rate"],
        productImage: productImageValues.map![json["product_image"]],
        categoriesName: json["categories_name"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "rate": rate,
        "product_image": productImageValues.reverse[productImage],
        "categories_name": categoriesName,
      };
}

enum ProductImage { DEFAULT_PNG }

final productImageValues =
    EnumValues({"default.png": ProductImage.DEFAULT_PNG});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
