import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/view_model/auth_view_model/forget_password_view_model.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
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
                            size: 22,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                              fontSize: 24,
                              color: AppColor().textcolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Please enter your email then we will\n"
                          " help you create a new password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor().textcolor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      MyCustomTextField(
                        hintText: 'ida_dennis2412@ex',
                        validator: (val) =>
                            val!.isEmpty ? "Please Enter your email" : null,
                        onChanged: (val) {
                          email = val;
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Consumer<ForgetPasswordViewModel>(
                          builder: (context, value, child) {
                        return PrimaryButtonLoading(
                          buttonText: value.forgetpasswordloading == false
                              ? Text(
                                  'Next',
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
                              debugPrint(email.toString());

                              debugPrint('email.toString()');

                              Map data = {
                                'email': email.toString().trim(),
                              };
                              // ignore: use_build_context_synchronously
                              value.forgetpasswordApi(
                                  data, context, email.toString());
                            }
                          },
                        );
                      }),
                    ]),
              ))),
    );
  }
}
