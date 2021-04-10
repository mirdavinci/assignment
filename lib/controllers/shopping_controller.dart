import 'dart:convert';

import 'package:assignment/models/product.dart';
import 'package:assignment/views/splash.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShoppingController extends GetxController {
  //var products = List.filled(5, Product);
  var products =
      List().obs; //cuz data must be observable in order to tracking changes

  var items = List().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    // const url = 'https://dev.alget.nl/store/135/';
    // return http.post(url,body: json.encode())
    await Future.delayed(Duration(seconds: 1));
    var productResult = saveJson.jsondata["entity"]["categories"];
    products.value = productResult;
    var itemResult = saveJson.jsondata["entity"]["products"];
    items.value = itemResult;
  }
}
