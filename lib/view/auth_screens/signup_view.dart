import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/signup_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool hidePassword = true;
  bool hideConPassword = true;
  List<String> gender = ['Male', 'Female'];
  bool checkbox1 = true;
  bool checkbox2 = true;
  bool checkbox3 = true;

  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? conPassword;

  @override
  Widget build(BuildContext context) {
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
                        'Sign Up',
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
                        'First Name or User Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    MyCustomTextField(
                      hintText: 'Enter name',
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter your Name" : null,
                      onChanged: (val) {
                        firstname = val;
                        return null;
                      },
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 10, top: 15),
                      child: Text(
                        'Last Name (Optional)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    MyCustomTextField(
                      hintText: 'Enter your last name',
                      // validator: (val) =>
                      //     val!.isEmpty ? "Please Enter your Last Name" : null,
                      onChanged: (val) {
                        lastname = val;
                        return null;
                      },
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 10, top: 15),
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
                      hintText: 'Enter your email',
                      validator: (val) =>
                          val!.isEmpty ? "Please Enter your email" : null,
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
                          : val.length < 8
                              ? "Password length less than 8 char"
                              : null,
                      onChanged: (val) {
                        password = val;
                        return null;
                      },
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 10, top: 15),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    MyCustomTextField(
                      hintText: 'Confirm password',
                      validator: (val) => val != password
                          ? "Please ReEnter same Password"
                          : null,
                      onChanged: (val) {
                        conPassword = val;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkbox1,
                          onChanged: (value) {
                            setState(() {
                              checkbox1 = value!;
                            });
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'In accepting and Signing up, I agree to the\n'
                                'Privacy Policy and the Terms of Services.',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColor().textcolor,
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.privacyPolicy,
                                  );
                                },
                                child: Text(
                                  'Read more',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor().tealcolor,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkbox2,
                          onChanged: (value) {
                            setState(() {
                              checkbox2 = value!;
                            });
                          },
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Text(
                              "I agree to, and have the choice of allowing my \n"
                              "profile, pictures, and likeness Ranked from 1-10\n"
                              "within the guidelines/policies of the SCALE app.\n"
                              "(This feature can be disabled by user)",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor().textcolor,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkbox3,
                          onChanged: (value) {
                            setState(() {
                              checkbox3 = value!;
                            });
                          },
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Text(
                              "I agree to allow my camera and microphone to \n"
                              "be utilized within the guidelines and policies of\n"
                              "the SCALE app.",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor().textcolor,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Consumer<SignUpViewModel>(builder: (context, value, child) {
                      return PrimaryButtonLoading(
                        buttonText: value.signuploading == false
                            ? Text(
                                'Sign Up',
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
                          if (checkbox1 == false) {
                            Utils.snackBar(
                                message: 'Please Agree To Privacy Policy',
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                context: context);
                          } else if (checkbox2 == false) {
                            Utils.snackBar(
                                message: 'Please Agree To Privacy Policy',
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                context: context);
                          } else if (checkbox3 == false) {
                            Utils.snackBar(
                                message: 'Please Agree To Allow Camera',
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                context: context);
                          } else {
                            if (_formKey.currentState!.validate()) {
                              if (kDebugMode) {
                                // print('password.toString()');
                                // print(firstname.toString());
                                // print(lastname.toString());
                                // print(email.toString());
                                // print(password.toString());
                                // print(conPassword.toString());
                              }

                              FormData data = FormData.fromMap({
                                'first_name': firstname,
                                'last_name': lastname,
                                'email': email.toString().trim(),
                                'password': password,
                                'password_confirmation': conPassword,
                                'age': 18,
                              });
                              // Map data = {
                              //   'first_name': firstname,
                              //   'last_name': lastname,
                              //   'email': email.toString().trim(),
                              //   'password': password,
                              //   'password_confirmation': conPassword,
                              //   // 'device_token': firebaseToken,
                              // };
                              value.signUpApi(
                                  data, context, firstname!, email!);
                            }
                          }
                        },
                      );
                    }),
                    // PrimaryButton(
                    //   buttonText: 'Sign Up',
                    //   passOnTap: () {
                    //     // Navigator.pushNamedAndRemoveUntil(
                    //     Navigator.pushNamed(
                    //       context,
                    //       RoutesName.location,
                    //       // (route) => false,
                    //     );
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 42, bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor().textcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.logIn,
                                // (route) => false,
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor().tealcolor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
