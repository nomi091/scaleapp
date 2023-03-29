// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';

class WalkThroughOneView extends StatelessWidget {
  const WalkThroughOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              debugPrint('swipe 111');
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.customwalkthroughtwoleft,
                (route) => false,
              );
            } else if (details.delta.dx > 0) {
              debugPrint('swipe 222');
            }
          },
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              SizedBox(
                height: 280,
                child: Stack(
                  children: [
                    Container(
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            width: (screenwidth * 0.49),
                            margin: const EdgeInsets.only(left: 40),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                walkthroughoneImgone,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.rotate(
                            angle: pi / 20,
                            child: Container(
                              width: (screenwidth * 0.49),
                              margin: const EdgeInsets.only(right: 40),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  walkthroughoneImgtwo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                color: Colors.transparent,
              ),
              Stack(
                children: [
                  Container(
                    height: 30,
                    color: Colors.transparent,
                    child: Container(
                      width: screenwidth,
                      height: 7.0,
                      margin: const EdgeInsets.fromLTRB(66, 11.5, 66, 11.5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: AppColor().greylightcolor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 73),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: AppColor().whitecolor,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().tealcolor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 40,
                color: Colors.transparent,
              ),
              Text(
                'Slide to see all images',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor().tealcolor,
                ),
              ),
              Container(
                height: 18,
                color: Colors.transparent,
              ),
              Text(
                "Click the tab to view the user's bio and additional\n"
                "pictures if they have them.\n"
                'Locate Scale picture slider and slide it from left to\n'
                "right to view all of the user's pictures.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor().textcolor,
                  height: 1.5,
                ),
              ),
              Container(
                height: 33,
                color: Colors.transparent,
              ),
              const WalkthroughDotsandSelected(
                passselectedIndex: 0,
              ),
              Container(
                height: 24,
                color: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  buttonText: 'Skip',
                  passOnTap: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    Navigator.pushNamed(
                      context,
                      RoutesName.chooseLoginSignUp,
                      // (route) => false,
                    );
                  },
                ),
              ),
              Container(
                height: 33,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
