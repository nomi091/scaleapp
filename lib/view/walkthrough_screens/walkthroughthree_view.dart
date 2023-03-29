// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';

class WalkThroughThreeView extends StatelessWidget {
  const WalkThroughThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            debugPrint('swipe 111');
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.customwalkthroughthreeright,
              (route) => false,
            );
          } else if (details.delta.dx > 0) {
            debugPrint('swipe 222');
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.customwalkthroughthreeleft,
              (route) => false,
            );
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                  //     color: AppColor().tealcolor,
                  //     border: Border.all(
                  //       color: AppColor().greylightcolor,
                  //       width: 5,
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(13),
                  //     child: Icon(
                  //       Icons.thumb_up,
                  //       color: AppColor().walkthroughthreethumbUPIconcolor,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 67,
                    width: 67,
                    child: Image.asset(
                      walkthroughthreeImgLike,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: AppColor().greylightcolor,
                        border: Border.all(
                          color:
                              AppColor().walkthroughthreeContainerBordercolor,
                          width: 1.0,
                        )),
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor().textcolor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 67,
                    width: 67,
                    child: Image.asset(
                      walkthroughthreeImgUnlike,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                  //     color: AppColor().tealcolor,
                  //     border: Border.all(
                  //       color: AppColor().greylightcolor,
                  //       width: 5,
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(13),
                  //     child: Icon(
                  //       Icons.thumb_down,
                  //       color: AppColor().walkthroughthreethumbDownIconcolor,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Container(
                height: 40,
                color: Colors.transparent,
              ),
              Stack(
                children: [
                  Container(
                    height: 36,
                    color: Colors.transparent,
                    child: Container(
                      width: screenwidth,
                      height: 5.0,
                      margin: const EdgeInsets.fromLTRB(66, 15.5, 66, 15.5),
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
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: AppColor().whitecolor,
                      ),
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Icon(
                          Icons.menu,
                          color: AppColor().walkthroughtwoIconcolor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 110,
                color: Colors.transparent,
              ),
              Text(
                'Like or Dislike Feature',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor().tealcolor,
                ),
              ),
              Container(
                height: 30,
                color: Colors.transparent,
              ),
              Center(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor().textcolor,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Next, you either ',
                      ),
                      // TextSpan(
                      //   text: 'swipe left',
                      //   style: TextStyle(
                      //     color: AppColor().redcolor,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                      const TextSpan(text: 'press the '),
                      TextSpan(
                        text: 'red \n thumbs down button',
                        style: TextStyle(
                          color: AppColor().redcolor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' for not interested or press \n the ',
                      ),
                      TextSpan(
                        text: 'green thumbs up button',
                        style: TextStyle(
                          color: AppColor().tealcolor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' to show interest.',
                      ),
                      const TextSpan(
                        text:
                            "Showing intrest \n means that if the same user also likes your profile then \n you will be able to message each other. Do not \n give a thumbs up (Like) if you don't desire \n communicating with this user",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.transparent,
              ),
              const WalkthroughDotsandSelected(
                passselectedIndex: 2,
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
