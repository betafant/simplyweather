import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplyweather/gridtiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double number = 5;
  var initiateGrid = CreateGrid();

  void test() {
    number += 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/weather_background.jpg"),
                fit: BoxFit.cover)),
        child: initiateGrid,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 30, right: 5),
            child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    initiateGrid = CreateGrid();
                    print('ok');
                  });
                },
                child: const Icon(Icons.refresh)),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
