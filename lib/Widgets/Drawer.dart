import 'package:covid19/Screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covid19/Screens/countryscreen.dart';
import 'package:covid19/Screens/HomeScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        color: Color(0xbf222222),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0),
                  color: Color(0xff222222),
                  height: height * 0.3,
                  child: Center(
                    child: Text(
                      'COVID-19 Tracker',
                      style: GoogleFonts.courgette(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoadingScreen(
                            country: 'All',
                          );
                        },
                      ),
                    );
                  },
                  child: DrawerCard(
                      icon: FontAwesomeIcons.globeAmericas,
                      description: 'Global Data'),
                ),
                GestureDetector(
                  child: DrawerCard(
                      icon: FontAwesomeIcons.search,
                      description: 'Search by Country'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CountryScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Made By: Karia Devansh',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Text(
                    'E-mail: devansh88karia@gmail.com',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
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

class DrawerCard extends StatelessWidget {
  IconData icon;
  String description;

  DrawerCard({@required this.icon, @required this.description});

  TextStyle kDrawerTextStyle = TextStyle(
    color: Color(0xff222222),
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35.0),
        ),
      ),
      height: height * 0.15,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[
              FaIcon(icon),
              SizedBox(
                width: width * 0.1,
              ),
              Text(
                description,
                style: kDrawerTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
