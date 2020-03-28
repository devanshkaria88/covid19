import 'package:flutter/material.dart';
import 'package:covid19/Widgets/Drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covid19/services/Networking.dart';
import 'package:covid19/services/Cases.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: () {
        CasesModel().getCountryCases('india');
      }),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'COVID-19 Tracker',
          style: GoogleFonts.courgette(fontSize: 27.0),
        ),
        backgroundColor: Color(0xff222222),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            DataCard(
              Cardtitle: 'Confirmed Cases',
              Number: 123321,
              cardcolor: Colors.green,
            ),
            DataCard(
              Cardtitle: 'Deaths',
              Number: 123321,
              cardcolor: Colors.red,
            ),
            DataCard(
              Cardtitle: 'Recovered Cases',
              Number: 123321,
              cardcolor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class DataCard extends StatefulWidget {
  String Cardtitle;
  var Number;
  Color cardcolor = Colors.green;

  DataCard({@required this.Cardtitle, @required this.Number, this.cardcolor});

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      shadowColor: Colors.red[800],
      margin: EdgeInsets.all(10.0),
      color: widget.cardcolor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Text(
              '${widget.Cardtitle} :',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              widget.Number.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
