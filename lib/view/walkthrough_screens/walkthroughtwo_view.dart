// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';

class WalkThroughTwoView extends StatelessWidget {
  const WalkThroughTwoView({Key? key}) : super(key: key);

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
                RoutesName.customwalkthroughtworight,
                (route) => false,
              );
            } else if (details.delta.dx > 0) {
              debugPrint('swipe 222');
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.customwalkthroughoneright,
                (route) => false,
              );
            }
          },
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 13),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: AppColor().redcolor,
                      ),
                      child: Text(
                        '1 -10',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: AppColor().textwhitecolor,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      transform: Matrix4.translationValues(0, -8, 0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        color: AppColor().tealcolor,
                      ),
                      child: Text(
                        'Rank Me',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColor().textwhitecolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 33,
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
                height: 80,
                color: Colors.transparent,
              ),
              Text(
                'Ranking Feature',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor().tealcolor,
                ),
              ),
              Container(
                height: 26,
                color: Colors.transparent,
              ),
              Text(
                "Ranking feature- Rank the person's physical attraction\n"
                "by moving the slider left to right to the appropriate\n"
                'number. 1 is the lowest and 10 is the highest. 1-3 is a\n'
                'lower range of attractiveness, 4-6 is average to good\n'
                'looking and 7-10 is very attractive to gorgeous. It may\n'
                'be best to use this scale as a guide during your\n'
                'ranking. Toggling your rank on, broadcast the rank of\n'
                'your profile for others to see. Toggling it off, only allows\n'
                "you to see what your rank is but no one else can see it.",
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
                passselectedIndex: 1,
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
