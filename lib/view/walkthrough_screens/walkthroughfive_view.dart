// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/res/widgets/walkthrough_widgets.dart/walkthroughfive_widget.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';

class WalkThroughFiveView extends StatelessWidget {
  const WalkThroughFiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              debugPrint('swipe 111');
            } else if (details.delta.dx > 0) {
              debugPrint('swipe 222');
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.customwalkthroughfiveright,
                (route) => false,
              );
            }
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: const [
                          SacalesLevels(
                            headerText: 'Scale Level 9.5 +',
                            imagepath: scale10,
                            bottomText: 'Platinum Dime',
                          ),
                          SacalesLevels(
                            headerText: 'Scale Level 9',
                            imagepath: scale9,
                            bottomText: 'Platinum',
                          ),
                          SacalesLevels(
                            headerText: 'Scale Level 8',
                            imagepath: scale8,
                            bottomText: 'Rose Gold',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: const [
                          SacalesLevels(
                            headerText: 'Scale Level 7',
                            imagepath: scale7,
                            bottomText: 'Gold',
                          ),
                          SacalesLevels(
                            headerText: 'Scale Level 6&5',
                            imagepath: scale6,
                            bottomText: 'Bronze',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 27,
                color: Colors.transparent,
              ),
              Text(
                'User Profile Rank’s',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor().tealcolor,
                ),
              ),
              Container(
                height: 14,
                color: Colors.transparent,
              ),
              Text(
                "Scale Medallions are awarded to profiles that are\n"
                "ranked 5 and above.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor().textcolor,
                  height: 1.5,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              const WalkthroughDotsandSelected(
                passselectedIndex: 4,
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
                    /// Todo Wrong Route

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
