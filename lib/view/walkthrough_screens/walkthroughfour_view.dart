// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';

class WalkThroughFourView extends StatefulWidget {
  const WalkThroughFourView({Key? key}) : super(key: key);

  @override
  State<WalkThroughFourView> createState() => _WalkThroughFourViewState();
}

class _WalkThroughFourViewState extends State<WalkThroughFourView> {
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppColor().AppBackgroundcolor,
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              debugPrint('swipe 111');
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.customwalkthroughfourright,
                (route) => false,
              );
            } else if (details.delta.dx > 0) {
              debugPrint('swipe 222');
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.customwalkthroughfourleft,
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
                width: screenwidth,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColor().whitecolor,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text(
                          'Pocket',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor().tealcolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 17, 17, 17),
                        child: FlutterSwitch(
                          width: 65.0,
                          height: 29.0,
                          toggleSize: 20.0,
                          showOnOff: true,
                          activeTextColor: AppColor().textwhitecolor,
                          inactiveTextColor: AppColor().textwhitecolor,
                          inactiveColor: AppColor().switchOffcolor,
                          activeColor: AppColor().tealcolor,
                          value: _enable,
                          onToggle: (val) {
                            setState(() {
                              _enable = val;
                            });
                          },
                        ),
                        // CustomSwitch(
                        //   value: _enable,
                        //   onChanged: (bool val) {
                        //     setState(() {
                        //       _enable = val;
                        //     });
                        //   },
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                color: Colors.transparent,
              ),
              Text(
                'Pocket Feature',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor().tealcolor,
                ),
              ),
              Container(
                height: 15,
                color: Colors.transparent,
              ),
              Text(
                "Pocket feature- Toggle ‘Pocket’ on to view profiles that\n"
                "have been ranked the same, one point less and one\n"
                'point higher than your profile. If you are ranked a 10,\n'
                'then turning your pocket on shows you profiles ranked\n'
                '8,9 and 10. These profiles have been ranked, by other\n'
                'users, to have the same or similar attraction levels as\n'
                'your own, which may increase compatibility. Toggling\n'
                '‘Pocket’ off allows you to see all the profiles available,\n'
                "regardless of their rank.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor().textcolor,
                  height: 1.5,
                ),
              ),
              Container(
                height: 64,
                color: Colors.transparent,
              ),
              const WalkthroughDotsandSelected(
                passselectedIndex: 3,
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
