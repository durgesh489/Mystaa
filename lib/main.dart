import 'package:flutter/material.dart';

import 'package:mystaa/account/signin_screen.dart';
import 'package:mystaa/home/all_screens.dart';
import 'package:mystaa/home/home_screen.dart';

import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/splash_screen.dart';
import 'package:mystaa/welcome_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
 
  runApp(const MyApp());
}

SharedPreferences? prefs;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin;
  doThisOnLaunch() async {
    isLogin = await Saver().getIsLogin() ?? false;
    setState(() {});
    print(isLogin);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doThisOnLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mystaa",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: isLogin == true ? AllScreens() : SplashScreen(),
    );
  }
}
