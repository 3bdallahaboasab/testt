import 'package:app111/dio.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() async {
  await DioHelper.init();

  runApp(const MyApp());
}

List top = [];
void getTopProduct() {
  DioHelper.getData(
    url: "http://192.168.1.143/medlink/public/v1/items/top",
  ).then((value) {
    top.add(value.data);
    print("***********************");

    print(top[0][0]["name"]);
    print(top[0][0]["name"]);
    print("***********************");
  }).catchError((onError) {
    // ignore: avoid_print
    print(onError);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
