// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // ignore: prefer_typing_uninitialized_variables
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        title: Text("Detail",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        // margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(30),
        // height: 150,
        // padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              _v1,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              _v2,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.network(
                _v3,
              ),
            ),

            // CircleAvatar(radius: 20, backgroundImage: NetworkImage(_v3)),

            // ClipOval(
            //   child: Image.network(
            //     _v3,
            //     height: 100,
            //     width: 100,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // Container(
            //   width: 100.0,
            //   height: 150.0,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         fit: BoxFit.cover, image: NetworkImage(_v3)),
            //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //     color: Colors.redAccent,
            //   ),
            // ),

            // ClipOval(
            //   child: Image.network(
            //     _v3,
            //     fit: BoxFit.fill,
            //   ),
            // ),

            SizedBox(
              height: 15,
            ),
            Text(_v4)
          ],
        ),
      ),
    );
  }
}
