import 'dart:convert';

import 'package:assignment/models/product.dart';
import 'package:assignment/views/CAt.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class saveJson {
  static var jsondata;
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool disConnectCheck = false;
  //checkinternet
  checkconnect() async {
    var checkinternet = await Connectivity().checkConnectivity();
    if (checkinternet == ConnectivityResult.none) {
      setState(() {
        disConnectCheck = true;
        print(disConnectCheck);
      });
    } else {
      setState(() {
        disConnectCheck = false;
        print(disConnectCheck);
        apiMethodLoadLesson();
      });
    }
  }

  apiMethodLoadLesson() async {
    var response = await http.get(
      "https://dev.alget.nl/store/135",
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      saveJson.jsondata = json.decode(response.body);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Category()));
    }
  }

  @override
  void initState() {
    checkconnect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkconnect();
        },
      ),
    );
  }
}
