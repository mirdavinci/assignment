import 'package:assignment/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: GetX<ShoppingController>(builder: (controller) {
          return ListView.separated(
            itemCount: controller.items.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(controller.items.value[index]['name'].toString()),
              );
            },
          );
        }));
  }
}
