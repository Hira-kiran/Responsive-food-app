// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:foodapp/Services/apiUrl.dart';
import '../Model/getProductModel.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<ProductsM> getThingsApi() async {
    final response = await http.get(Uri.parse(ApiUrl.baseUrl));
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductsM.fromJson(data);
    } else {
      return ProductsM.fromJson(data);
    }
  }
}
