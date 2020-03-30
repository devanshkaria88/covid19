import 'package:flutter/material.dart';
import 'package:covid19/Widgets/Drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covid19/Widgets/Datacard.dart';
import 'package:covid19/services/Cases.dart';

class HomeScreen extends StatefulWidget {
  final allcases;

  HomeScreen({this.allcases});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  var TotalCases;
  var CountryName;
  var RecoveredCases;
  var Deaths;
  var Criticalcases;
  var ActiveCases;
  var newCases;
  String Message;

  @override
  void initState() {
    super.initState();
    updateUI(widget.allcases);
  }

  void updateUI(dynamic casesdata) {
    setState(() {
      if (casesdata == null) {
        TotalCases = 0;
        CountryName = '';
        Criticalcases = 0;
        RecoveredCases = 0;
        ActiveCases = 0;
        Deaths = 0;
        Message = 'Unable to retrieve data';
        return;
      }
      CountryName = casesdata['response'][0]['country'];
      TotalCases = casesdata['response'][0]['cases']['total'];
      ActiveCases = casesdata['response'][0]['cases']['active'];
      RecoveredCases = casesdata['response'][0]['cases']['recovered'];
      Criticalcases = casesdata['response'][0]['cases']['critical'];
      Deaths = casesdata['response'][0]['deaths']['total'];
      if (CountryName == 'All') {
        CountryName = 'World Data';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Gradient redgradient = LinearGradient(
        colors: [
          Colors.red[600],
          Colors.red[500],
          Colors.red[400],
          Colors.red[300],
          Colors.red[200],
          Colors.red[100],
        ],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter);
    Gradient greengradient = LinearGradient(
        colors: [
          Colors.green[600],
          Colors.green[500],
          Colors.green[400],
          Colors.green[300],
          Colors.green[200],
          Colors.green[100],
        ],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter);
    Gradient bluegradient = LinearGradient(
        colors: [
          Colors.blue[600],
          Colors.blue[500],
          Colors.blue[400],
          Colors.blue[300],
          Colors.blue[200],
          Colors.blue[100],
        ],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter);
    Gradient greygradient = LinearGradient(
        colors: [
          Colors.grey[600],
          Colors.grey[500],
          Colors.grey[400],
          Colors.grey[300],
          Colors.grey[200],
          Colors.grey[100],
        ],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })
        ],
        title: Text(
          'COVID-19 Tracker',
          style: GoogleFonts.courgette(fontSize: 27.0),
        ),
        backgroundColor: Color(0xff222222),
      ),
      body: RefreshIndicator(
        backgroundColor: Color(0xff222222),
        color: Colors.white,
        displacement: 40.0,
        key: _refreshIndicatorKey,
        onRefresh: () async {
          if (CountryName == 'World Data') {
            CountryName = 'All';
          }
          var casesdata = await CasesModel().getCountryCases(CountryName);
          updateUI(casesdata);
        },
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CountryNameCard(
                        country: CountryName,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DataCard(
                        cardGradient: bluegradient,
                        cardcolor: Colors.blue[300],
                        Cardtitle: 'Total Cases',
                        Number: TotalCases.toString(),
                      ),
                      DataCard(
                        cardGradient: redgradient,
                        cardcolor: Colors.red[300],
                        Cardtitle: 'Deaths',
                        Number: Deaths.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DataCard(
                        cardcolor: Colors.green[300],
                        cardGradient: greengradient,
                        Cardtitle: 'Recovered',
                        Number: RecoveredCases.toString(),
                      ),
                      DataCard(
                        cardGradient: greygradient,
                        cardcolor: Colors.grey[300],
                        Cardtitle: 'Critical',
                        Number: Criticalcases.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryNameCard extends StatelessWidget {
  String country;

  CountryNameCard({this.country});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Gradient gradient = LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [
          Colors.cyan[500],
          Colors.cyan[400],
          Colors.cyan[300],
          Colors.cyan[200],
          Colors.cyan[100],
        ]);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        height: height * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          gradient: gradient,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.cyan[300], spreadRadius: 2.0, blurRadius: 10.0),
          ],
        ),
        child: Center(
          child: Text(
            country,
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
