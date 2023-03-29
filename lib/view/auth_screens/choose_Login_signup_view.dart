// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';

class ChooseLoginSignupScreen extends StatelessWidget {
  const ChooseLoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenheight = MediaQuery.of(context).size.height;
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 121),
          child: Column(children: [
            Center(
              child: Image.asset(
                logo,
                width: 200,
                height: 172,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 85,
            ),
            PrimaryButton(
              buttonText: 'Sign In',
              passOnTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.logIn,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              buttonText: 'Sign Up',
              passOnTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.signUp,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              buttonText: 'About App',
              buttonColor: AppColor().whispercolor,
              buttonTextColor: AppColor().tealcolor,
              passOnTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.aboutapp,
                  arguments: {
                  'homepage': false,
                }
                );
              },
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Copyright 2022 Scale App',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor().textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
