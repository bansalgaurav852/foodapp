import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/assets/assets.dart';
import 'package:foodapp/constant/const.dart';

import '../update.dart';
import 'Homepage.dart';

class Appnavigation extends StatefulWidget {
  const Appnavigation({Key? key}) : super(key: key);

  @override
  State<Appnavigation> createState() => _HomePageState();
}

class _HomePageState extends State<Appnavigation> {
  int selectedindex = 0;
  bool iconselected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: selectedindex,
          children: const [Homepage(), Update(), Update(), Update()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          selectedItemColor: red,
          unselectedItemColor: grey,
          onTap: (value) {
            setState(() {
              selectedindex = value;
            });
          },
          currentIndex: selectedindex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.home),
                activeIcon: SvgPicture.asset(Assets.ahome),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.fav),
                activeIcon: SvgPicture.asset(Assets.afav),
                label: "Favorites"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.account),
                activeIcon: SvgPicture.asset(Assets.aaccount),
                label: "Account"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.more),
                activeIcon: SvgPicture.asset(Assets.amore),
                label: "More")
          ],
        ),
      ),
    );
  }
}
