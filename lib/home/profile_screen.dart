import 'package:flutter/material.dart';
import 'package:mystaa/account/user_profile_screen.dart';
import 'package:mystaa/others/cart_screen.dart';
import 'package:mystaa/others/favourite_products._screen.dart';

import 'package:mystaa/others/notifications_screen.dart';
import 'package:mystaa/others/orders_screen.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int i = 0;
  String? myName;
  String? myEmail;

  getUserInfo() async {
    myName = await Saver().getUserName();
    myEmail = await Saver().getUserEmail();
    setState(() {});
  }

  // int currentIndex = 0;

  List screens = [
    // FavouriteProductsScreen(),
    // NotificationsScreen(),
    // CartScreen(),
    // OrdersScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
    screens = [
      FavouriteProductsScreen(false),
      NotificationsScreen(),
      CartScreen(false),
      OrdersScreen()
    ];
  }

  Widget CustomScreens() {
    if (i == 0) {
      return FavouriteProductsScreen(false);
    } else if (i == 1) {
      return NotificationsScreen();
    } else if (i == 2) {
      return CartScreen(false);
    } else {
      return OrdersScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20),
      //         bottomRight: Radius.circular(20)),
      //   ),
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(120),
      //     child: BottomNavigationBar(
      //       elevation: 0,
      //       backgroundColor: green,
      //       currentIndex: currentIndex,
      //       onTap: (index) {
      //         setState(() {
      //           currentIndex = index;
      //         });
      //       },
      //       type: BottomNavigationBarType.fixed,
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: CustomIcon(Icons.favorite_border_outlined),
      //           label: "",
      //           activeIcon: CustomIcon(Icons.favorite),
      //         ),
      //         BottomNavigationBarItem(
      //             icon: CustomIcon(Icons.notifications_outlined),
      //             label: "",
      //             activeIcon: CustomIcon(Icons.notifications)),
      //         BottomNavigationBarItem(
      //             icon: CustomIcon(Icons.shopping_cart_outlined),
      //             label: "",
      //             activeIcon: CustomIcon(Icons.shopping_cart)),
      //         BottomNavigationBarItem(
      //             icon: CustomIcon(Icons.work_outline),
      //             label: "",
      //             activeIcon: CustomIcon(Icons.work)),
      //       ],
      //     ),
      //   ),
      // ),
      // body: NotificationsScreen(),

      body: Column(
        children: [
          Container(
            width: fullWidth(context),
            height: 200,
            decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                goto(context, UserProfileScreen());
                              },
                              icon: Icon(
                                Icons.settings,
                                size: 30,
                                color: white,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            goto(context, UserProfileScreen());
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: white,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                              ),
                              HSpace(15),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bAppText("Profile", 26, white),
                                  bAppText(myEmail.toString(), 17, white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  child: Row(
                    children: [
                      CustomIcon(
                          i == 0
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          () {},
                          0),
                      HSpace(10),
                      CustomIcon(
                          i == 1
                              ? Icons.notifications
                              : Icons.notifications_outlined,
                          () {},
                          1),
                      HSpace(10),
                      CustomIcon(
                          i == 2
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          () {},
                          2),
                      HSpace(10),
                      CustomIcon(
                          i == 3 ? Icons.work : Icons.work_outline, () {}, 3),
                    ],
                  ),
                )
              ],
            ),
          ),
          VSpace(30),
          Expanded(child: CustomScreens())
          // Expanded(child: FavouriteProductsScreen(false))
        ],
      ),
    );
  }

  Widget CustomIcon(IconData icon, Function fun, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          i = index;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Icon(
            icon,
            size: 30,
            color: green,
          ),
        ),
      ),
    );
  }
  // Widget CustomIcon(IconData icon) {
  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(13.0),
  //       child: Icon(
  //         icon,
  //         size: 30,
  //         color: green,
  //       ),
  //     ),
  //   );
  // }

  // Widget CustomTile(IconData icon, String title) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: lightGrey, borderRadius: BorderRadius.circular(10)),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
  //         child: Row(
  //           children: [
  //             Icon(
  //               icon,
  //               color: grey,
  //             ),
  //             HSpace(20),
  //             normalText(title, 17),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
