import 'package:flutter/material.dart';
import 'package:mystaa/account/signin_screen.dart';
import 'package:mystaa/account/signup_screen.dart';
import 'package:mystaa/home/all_screens.dart';
import 'package:mystaa/main.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/header-logo.png"),
              VSpace(80),
              kSecondaryButton(() {
                goto(context, SignInScreen());
              }, "Sign In", darkGreen, 150),
              VSpace(20),
               kSecondaryButton(() {
                goto(context, SignUpScreen());
              }, "Sign Up", darkGreen, 150),
            
              VSpace(20),
                PrimaryOutlineButton(() {
                 Saver().setIsLogin(true);
                    goto(context, AllScreens());
              }, "Sign In as guest", 220),
              
            ],
          ),
        ),
      ),
    );
  }
}
