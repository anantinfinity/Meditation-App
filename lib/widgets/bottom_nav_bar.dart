import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/diet_rec.dart';
import 'package:meditation_app/screens/kegel_ex.dart';
import 'package:meditation_app/screens/settings.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: "assets/icons/calendar.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      diet_rec(), // make screen and push to route
                ),
              );
            },
          ),
          BottomNavItem(
            title: "All Exercises",
            svgScr: "assets/icons/gym.svg",
            isActive: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      kegel_ex(), // make screen and push to route
                ),
              );
            },
          ),
          BottomNavItem(
            title: "About",
            svgScr: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      settings(), // make screen and push to route
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key key,
    this.svgScr,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
