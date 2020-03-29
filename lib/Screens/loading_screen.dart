import 'package:flutter/material.dart';
import 'package:covid19/services/Cases.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'HomeScreen.dart';


class LoadingScreen extends StatefulWidget {
  final country;
  LoadingScreen({this.country});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override void initState() {
    super.initState();
    getCasesData();
  }


  void getCasesData() async{
    var casesdata = await CasesModel().getCountryCases(widget.country);
    Navigator.push(context, MaterialPageRoute(builder: (context){return
      HomeScreen(allcases: casesdata,);}),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xbf222222),
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 75.0,
            duration: Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
