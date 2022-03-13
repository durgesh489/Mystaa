import 'package:flutter/material.dart';
import 'package:mystaa/main.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/welcome_screen.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? myName;
  String? myEmail;

  getUserInfo() async {
    myName = await Saver().getUserName();
    myEmail = await Saver().getUserEmail();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile"),
      ),
      body: Container(
        width: fullWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  VSpace(25),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: lightGrey,
                    child: Icon(
                      Icons.person,
                      color: green,
                      size: 40,
                    ),
                  ),
                  VSpace(10),
                  boldText(myName ?? "Unknown", 22),
                  nAppText(myEmail ?? "Unknown@gmail.com", 16, grey)
                ],
              ),
            ),
            VSpace(30),
            Column(
              children: [
                CustomListTile(Icons.info, "App Info", () {}),
                CustomListTile(Icons.info, "Terms and Conditions", () {}),
                CustomListTile(Icons.privacy_tip, "Privacy Policy", () {}),
                CustomListTile(Icons.logout, "Sign Out", () {
                  Saver().setIsLogin(false);
                  gotoWithoutBack(context, WelcomeScreen());
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget CustomListTile(IconData icon, String title, Function fun) {
    return ListTile(
      onTap: () {
        fun();
      },
      leading: Icon(
        icon,
        color: green,
      ),
      title: Text(title),
    );
  }
}
