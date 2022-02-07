// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        title: Text(
          "แอปนี้ดีแน่นอน",
          style: TextStyle(color: Colors.amber),
        ),

        // flexibleSpace: Image(
        //   image: NetworkImage(
        //       "https://media.istockphoto.com/vectors/hands-holding-phone-with-review-rating-reviews-stars-with-good-and-vector-id1281246391?s=612x612"),
        //   fit: BoxFit.cover,
        // ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot sanpshot) {
              // var data = json.decode(sanpshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(
                      sanpshot.data[index]['title'],
                      sanpshot.data[index]['subtitle'],
                      sanpshot.data[index]['image_url'],
                      sanpshot.data[index]['detail']);
                },
                itemCount: sanpshot.data.length,
              );
            },
            future: getData(),
            // future:
            //     DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )),
    );
  }

  Widget MyBox(String title, String subtitle, String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          //color:  Colors.blue[300],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(image_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.55), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                print("Next Page");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(v1, v2, v3, v4)));
              },
              child: Text("อ่านต่อ....",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.amber[400],
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }

  Future getData() async {
    //https://raw.githubusercontent.com/Theerawat30/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/Theerawat30/BasicAPI/main/data.json');
    var reaponse = await http.get(url);
    var result = json.decode(reaponse.body);
    return result;
  }
}
