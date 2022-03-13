import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mystaa/account/signup_screen.dart';
import 'package:mystaa/home/all_screens.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/widgets/custom_textfield.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signinKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: signinKey,
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        "images/sign_in.png",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VSpace(120),
                            bAppText("Welcome\nBack", 34, white),
                            VSpace(170),
                            CustomTextField(
                              controller: emailController,
                              validators: [
                                RequiredValidator(
                                    errorText: "Please fill Email"),
                                EmailValidator(
                                    errorText: "This is not a valid Email"),
                              ],
                              hintText: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            VSpace(20),
                            CustomTextField(
                              controller: passwordController,
                              validators: [
                                RequiredValidator(
                                    errorText: "Please fill Password"),
                              
                              ],
                              hintText: "Password",
                              isPassword: true,
                            ),
                            VSpace(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                boldText("Sign In", 22),
                                InkWell(
                                  onTap: () async {
                                    if (signinKey.currentState!.validate()) {
                                      print("signin");
                                      Map<String, dynamic> registerData = {
                                        "email": emailController.text,
                                        "password": passwordController.text
                                      };
                                      var result = await ApiMethods()
                                          .postData(registerData, loginApi);
                                      print(result["error"]);
                                      // if (result["error"] == false) {
                                        // Saver().setUserId(result["data"]["id"]);
                                        Saver().setIsLogin(true);
                                        Saver()
                                            .setUserEmail(emailController.text);
                                        Saver().setUserPassword(
                                            passwordController.text);
                                        gotoWithoutBack(context, AllScreens());
                                        // showSnackbar(
                                        //     context, result["message"]);
                                      // } else {
                                      //   showSnackbar(
                                      //       context, result["message"]);
                                      // }
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: darkGreen,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 30,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VSpace(60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    goto(context, SignUpScreen());
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
