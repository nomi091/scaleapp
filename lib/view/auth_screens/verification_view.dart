import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';

import '../../view_model/auth_view_model/verify_otp_view_model.dart';

class VerificationScreen extends StatefulWidget {
  final String emailfromforgetpasswor;
  const VerificationScreen({
    super.key,
    required this.emailfromforgetpasswor,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? otp;
  bool autofocus = true;
  bool? verifyOtpCondition;
  // String? email;
  TextEditingController pinController = TextEditingController();
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
                          "Verification",
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
                          "We did send OTP code to your email,\n"
                          " please check it and enter below",
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
                      PinCodeTextField(
                        appContext: context,
                        controller: pinController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow((RegExp("[0-9]"))),
                          LengthLimitingTextInputFormatter(4)
                        ],
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        // obscuringCharacter: '*',
                        // obscuringWidget: const FlutterLogo(
                        //   size: 24,
                        // ),
                        blinkWhenObscuring: false,
                        // animationType: AnimationType.fade,
                        validator: (v) {
                          if (pinController.text.length < 4) {
                            return "Enter 4 characters pin";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 50,
                          fieldWidth: 60,
                          activeFillColor: AppColor().greylightcolor,
                          selectedColor: AppColor().greylightcolor,
                          inactiveColor: AppColor().greylightcolor,
                          inactiveFillColor: AppColor().greylightcolor,
                          selectedFillColor: AppColor().greylightcolor,
                        ),
                        cursorColor: const Color(0xff9F9F9F),
                        // animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        // errorAnimationController: errorController,

                        keyboardType: TextInputType.number,
                        // boxShadows: const [
                        //   BoxShadow(
                        //     offset: Offset(0, 1),
                        //     color: Colors.black12,
                        //     blurRadius: 10,
                        //   )
                        // ],
                        onCompleted: (v) {
                          // debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          otp = value.toString();
                          // debugPrint(otp.toString()+'   llllll');
                          setState(() {
                            // currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Consumer<VerifyOtpViewModel>(
                          builder: (context, value, child) {
                        return PrimaryButtonLoading(
                          buttonText: value.verifyotploading == false
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
                              debugPrint(
                                  widget.emailfromforgetpasswor.toString());
                              debugPrint(otp.toString());

                              debugPrint('email.toString()');

                              Map data = {
                                'email':
                                    widget.emailfromforgetpasswor.toString(),
                                'otp': otp,
                              };
                              // ignore: use_build_context_synchronously
                              value.verifyOtpApi(
                                data,
                                context,
                                widget.emailfromforgetpasswor.toString(),
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
