import 'package:assignment/controllers/shopping_controller.dart';
import 'package:assignment/models/product.dart';
import 'package:assignment/views/Items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  // var products = List<Product>().obs;
  final shoppingController = Get.put(ShoppingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: GetX<ShoppingController>(builder: (controller) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisExtent: 200,
            mainAxisSpacing: 20,
          ),
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Items()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff005585),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //image
                    // ClipRRect(
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(17),
                    //   ),
                    //   child: Image(
                    //     height: 111,
                    //     width: 118,
                    //     image: NetworkImage(
                    //         controller.products.value[index]['images'][1]),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    //title
                    Text(
                      controller.products.value[index]["name"],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        height: 2,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
