import 'package:flutter/material.dart';
import 'package:covid19/Drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'COVID-19 Tracker',
          style: TextStyle(fontSize: 23.0,),
        ),
        backgroundColor: Color(0xff222222),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
