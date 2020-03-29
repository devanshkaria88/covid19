import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DataCard extends StatefulWidget {
  String Cardtitle;
  var Number;
  Color cardcolor;
  Gradient cardGradient;

  DataCard({this.Cardtitle, this.Number, this.cardcolor, this.cardGradient});

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        height: height * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          gradient: widget.cardGradient,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(color: widget.cardcolor, spreadRadius: 2.0, blurRadius: 10.0),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.Cardtitle, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, ),),
              SizedBox(height: 20.0,),
              Text(widget.Number, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35.0,),),
            ],
          ),
        ),
      ),
    );
  }
}
