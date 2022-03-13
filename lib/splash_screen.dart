import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mystaa/account/signin_screen.dart';
import 'package:mystaa/home/all_screens.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/welcome_screen.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  doThisOnLaunch() async {
    isLogin = (await Saver().getIsLogin())!;
    setState(() {});
    print(isLogin);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doThisOnLaunch();
    Timer(Duration(seconds: 3), () {
      gotoWithoutBack(context, isLogin ? AllScreens() : WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("images/header-logo.png"),
          ),
        ),
      ),
    );
  }
}
