import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/auth_view_model/login_view_model.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  String? email;
  String? password;
  @override
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 83, 20, 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        logo,
                        width: 150,
                        height: 128,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    MyCustomTextField(
                      hintText: 'Email',
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter your Name" : null,
                      onChanged: (val) {
                        email = val;
                        return null;
                      },
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 10, top: 15),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    MyCustomTextField(
                      hintText: 'Password',
                      validator: (val) => val!.isEmpty
                          ? "Please Enter Password"
                          : val.length < 6
                              ? "Password length less than 6 char"
                              : null,
                      onChanged: (val) {
                        password = val;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Consumer<LoginViewModel>(builder: (context, value, child) {
                      return PrimaryButtonLoading(
                        buttonText: value.loginloading == false
                            ? Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor().textwhitecolor,
                                ),
                              )
                            : customcircularprogress(
                                passcolor: AppColor().whitecolor,
                              ),
                        passOnTap: () async {
                          // Navigator.pushNamed(
                          //   context,
                          //   RoutesName.bottomnav,
                          // );

                          String? firebaseToken =
                              await FirebaseMessaging.instance.getToken();
                          debugPrint('firebaseToken.toString()');
                          debugPrint(firebaseToken.toString());

                          if (_formKey.currentState!.validate()) {
                            // debugPrint(' firebaseToken $firebaseToken');
                            // debugPrint(email.toString());
                            // debugPrint(password.toString());
                            // debugPrint('password.toString()');

                            Map data = {
                              'email': email,
                              'password': password,
                              'device_token': firebaseToken,
                            };
                            // ignore: use_build_context_synchronously
                            loginViewModel.loginApi(data, context, email!);
                          }
                        },
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.forget,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 23),
                        alignment: Alignment.center,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor().textcolor,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Platform.isIOS
            ? const EdgeInsets.only(bottom: 50)
            : const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account? ',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColor().textcolor,
                  fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.signUp,
                );
              },
              child: Text(
                'Sign Up ',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor().tealcolor,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
