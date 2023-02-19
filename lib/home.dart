import 'package:app111/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  void initState() {
    super.initState();
    getTopProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 270,
            child: ListView.separated(
              itemBuilder: (context, index) => Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: HexColor("#f3f3f3")),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  child: buildMostPopularItem(
                    context,
                    index,
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: top[0].length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }

  Widget buildMostPopularItem(context, int index) => GestureDetector(
        onTap: () {
          // getProductDetails(index);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: "1",
                  child: Image(
                      fit: BoxFit.contain,
                      height: 170,
                      image: NetworkImage("${top[0][index]["image"]}" ??
                          "https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${top[0][index]["name"]}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.arimaMadurai(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "${top[0][index]["price"]} ",
                              style: const TextStyle(color: Colors.orange),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Spacer(),
                            Text(
                              "${top[0][index]["supplierName"]}",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
