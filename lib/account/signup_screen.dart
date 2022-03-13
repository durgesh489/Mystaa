import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mystaa/home/all_screens.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/services/save_user_info.dart';
import 'package:mystaa/widgets/custom_textfield.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: signupKey,
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        "images/sign_up.png",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VSpace(120),
                            bAppText("Create\nAccount", 34, white),
                            VSpace(90),
                            CustomTextField(
                              controller: nameController,
                              validators: [
                                RequiredValidator(
                                    errorText: "Please fill Name"),
                              ],
                              hintText: "Name",
                              color: white,
                            ),
                            VSpace(20),
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
                              color: white,
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
                              color: white,
                            ),
                            VSpace(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                bAppText("Sign Up", 22, white),
                                InkWell(
                                  onTap: () async {
                                    if (signupKey.currentState!.validate()) {
                                      print("signup");
                                      Map<String, dynamic> registerData = {
                                        "name": nameController.text,
                                        "email": emailController.text,
                                        "password": passwordController.text
                                      };
                                      var result = await ApiMethods()
                                          .postData(registerData, registerApi);
                                      print(result);
                                      // if (result["error"] == false) {
                                        // Saver().setUserId(result["data"]["id"]);
                                        // print(result["data"]["id"]);
                                        Saver().setIsLogin(true);
                                        Saver()
                                            .setUserName(nameController.text);
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
                            InkWell(
                              onTap: () {
                                goBack(context);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
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
