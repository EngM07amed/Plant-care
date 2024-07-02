import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:plantcare/screens/chat.dart';
import 'package:plantcare/screens/home.dart';
import 'package:plantcare/screens/profile.dart';
import 'package:line_icons/line_icons.dart';

class select1 extends StatefulWidget {
  const select1({super.key});

  @override
  State<select1> createState() => _select1State();
}

class _select1State extends State<select1> {
  int _selectpage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _screen = [
      HomePage(),
      ChatPage(),
      Profile(),
    ];
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.r,
              color: Colors.black.withOpacity(.4),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.0.r, vertical: 8.r),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24.r,
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 12.r),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.facebookMessenger,
                  text: 'chat',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectpage,
              onTabChange: (index) {
                setState(() {
                  _selectpage = index;
                });
              },
            ),
          ),
        ),
      ),
      body: _screen[_selectpage],
    ));
  }
}
