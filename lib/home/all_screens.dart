import 'package:flutter/material.dart';
import 'package:mystaa/home/categories_screen.dart';
import 'package:mystaa/home/explore_screen.dart';
import 'package:mystaa/home/home_screen.dart';
import 'package:mystaa/home/offers_scree.dart';
import 'package:mystaa/home/profile_screen.dart';

import 'package:mystaa/resources/colors.dart';

class AllScreens extends StatefulWidget {
  const AllScreens({Key? key}) : super(key: key);

  @override
  _AllScreensState createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  List screens = [
    HomeScreen(),
    ExploreScreen(),
    CategoriesScreen(),
    // OffersScreen(),
    ProfileScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: white),
          unselectedLabelStyle: TextStyle(color: black),
          selectedItemColor: white,
          unselectedItemColor: black,
          backgroundColor: green,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/home.png",
                width: 27,
                height: 27,
                color: Colors.grey[800],
              ),
              label: "Home",
              activeIcon: Image.asset(
                "images/home.png",
                width: 27,
                height: 27,
                color: white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 30,
                color: Colors.grey[800],
              ),
              label: "Explore",
              activeIcon: Icon(
                Icons.explore,
                size: 30,
                color: white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/categories.png",
                width: 27,
                height: 27,
                color: Colors.grey[800],
              ),
              label: "Categories",
              activeIcon: Image.asset(
                "images/categories.png",
                width: 27,
                height: 27,
                color: white,
              ),
            ),
            // BottomNavigationBarItem(
            //   icon: Image.asset(
            //     "images/offers.png",
            //     width: 30,
            //     height: 30,
            //     color: grey,
            //   ),
            //   label: "Offers",
            //   activeIcon: Image.asset(
            //     "images/offers.png",
            //     width: 30,
            //     height: 30,
            //     color: green,
            //   ),
            // ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/user.png",
                width: 27,
                height: 27,
                color:Colors.grey[800],
              ),
              label: "Account",
              activeIcon: Image.asset(
                "images/user.png",
                width: 27,
                height: 27,
                color: white,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: screens[currentIndex],
        ));
  }
}
