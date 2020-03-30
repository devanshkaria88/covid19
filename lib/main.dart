import 'package:covid19/Screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19/Screens/HomeScreen.dart';
import 'package:covid19/Screens/countryscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID - 19',
      routes: {
        '/home' : (Context) => HomeScreen(),
        '/country' : (Context) => CountryScreen(),
        '/loading' : (Context) => LoadingScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(country: 'All',),
    );
  }
}
