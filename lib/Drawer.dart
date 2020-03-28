import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

TextStyle kDrawerTextStyle = TextStyle(
  color: Color(0xff222222),
  fontSize: 30.0,
);

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        color: Color(0xbf222222),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 15.0),
              color: Color(0xff222222),
              height: height * 0.3,
              child: Center(
                child: Text(
                  'COVID-19 Tracker',
                  style: TextStyle(color: Colors.white, fontSize: 45.0),
                ),
              ),
            ),
            DrawerCard(icon: Icons.account_balance, description: 'Home'),
            DrawerCard(icon: Icons.attach_money, description: 'Donations'),
            DrawerCard(icon: Icons.description, description: 'World Data'),
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
              Icon(
                icon,
                size: 35,
              ),
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
