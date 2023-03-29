import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';

import '../../view_model/auth_view_model/rest_password_view_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String emailfromforgetpasswor;
  const ResetPasswordScreen({
    super.key,
    required this.emailfromforgetpasswor,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String? password;
  String? confirmPassword;
  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 45, left: 15, bottom: 55),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColor().appIconcolor,
                            size: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Create new password",
                          style: TextStyle(
                              fontSize: 24,
                              color: AppColor().textcolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Center(
                        child: Text(
                          "Please enter your new password and\n confirm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor().textcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
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
                        hintText: 'Confirm new password',
                        validator: (val) => val!.isEmpty
                            ? "Please ReEnter Password"
                            : password != confirmPassword
                                ? "Does not match"
                                : null,
                        onChanged: (val) {
                          confirmPassword = val;
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Consumer<ResetPasswordViewModel>(
                          builder: (context, value, child) {
                        return PrimaryButtonLoading(
                          buttonText: value.resetPasswordloading == false
                              ? Text(
                                  'Confirm',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor().textwhitecolor,
                                  ),
                                )
                              : customcircularprogress(
                                  passcolor: AppColor().whitecolor,
                                ),
                          passOnTap: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint(
                                  widget.emailfromforgetpasswor.toString());
                              debugPrint('$password');
                              debugPrint('$confirmPassword');
                              debugPrint('email.toString()');

                              Map data = {
                                'email':
                                    widget.emailfromforgetpasswor.toString(),
                                'password': password,
                                'password_confirmation': confirmPassword,
                              };
                              // ignore: use_build_context_synchronously
                              value.resetPasswordApi(
                                data,
                                context,
                              );
                            }
                            // Navigator.pushReplacementNamed(
                            //   context,
                            //   RoutesName.resetpassword,
                            // );
                          },
                        );
                      }),
                    ]),
              ))),
    );
  }
}
