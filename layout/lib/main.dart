// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
 // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "แอปแนะนำเกี่ยวกับการออกกำลังกาย ง่ายๆ ฉบับคนเริ่มต้น", 
      home:  HomePage(),

    );
  }
}