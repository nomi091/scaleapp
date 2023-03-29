// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/provider/about_app_providers/about_app_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'dart:ui';
import 'dart:math';

class AboutAppView extends StatefulWidget {
  final bool? homepage;
  const AboutAppView({Key? key, this.homepage}) : super(key: key);

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  @override
  void initState() {
    ///
    final aboutAppProvider =
        Provider.of<AboutAppProvider>(context, listen: false);
    aboutAppProvider.setblurAfter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final aboutAppProvider =
        Provider.of<AboutAppProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'About Scale App',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: AppColor().textcolor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: (screenwidth * 0.5) - 30,
                            child: PrimaryButton(
                              buttonText: 'How to Use',
                              passOnTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.howtouseapp,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: (screenwidth * 0.5) - 30,
                            child: PrimaryButton(
                              buttonText: 'Matching',
                              passOnTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.matching,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ever wonder why the people you are interested in aren’t often interested in you or the people that are interested in you, you aren’t interested in them? If so, Scale App helps you understand why this is often the case and what you can do to limit this from happening to you.\n\n"
                        "Scale App helps to teach who to focus on in dating and to understand why you should focus on them. Many people don’t know who to date or who to stay away from so they end up dating a lot of the wrong people. Scale App is designed to provide actionable intelligence in this regard.\n\n"
                        'How to use scale rankings- All opinions are not created equally! While some opinions might not matter to you, hopefully, you match with a person and grow to value their opinion. This would be a great opportunity to ask what number they ranked you and to find out why. While this information may be difficult to hear, it may provide valuable feedback that you can use to improve in the area described by this valued person.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor().textcolor,
                          height: 1.8,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      PrimaryButton(
                        buttonText: 'Continue',
                        passOnTap: () async {
                          aboutAppProvider.setblur();
                          await Future.delayed(const Duration(seconds: 2));
                          if (widget.homepage == false) {
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesName.logIn,
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ]),
              ),
            ),
            Consumer<AboutAppProvider>(builder: (context, value, child) {
              return value.blur == true
                  ? SizedBox(
                      width: screenwidth,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(),
                            //I blured the parent container to blur background image, you can get rid of this part
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                              child: Container(
                                //you can change opacity with color here(I used black) for background.
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.55)),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(15.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //you can get rid of below line also
                              borderRadius: BorderRadius.circular(10.0),
                              //below line is for rectangular shape
                              shape: BoxShape.rectangle,
                              //you can change opacity with color here(I used black) for rect
                              color: Colors.black.withOpacity(0.5),
                              //I added some shadow, but you can remove boxShadow also.
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 65,
                                  width: 65,
                                  child: Stack(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.solidHeart,
                                        color: AppColor().whitecolor,
                                        size: 65,
                                      ),
                                      Center(
                                        child: Stack(
                                          children: [
                                            Transform.rotate(
                                              angle: pi / 4,
                                              child: Container(
                                                height: 24,
                                                width: 24,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .ellipsisVertical,
                                                color: AppColor().whitecolor,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Image.asset(
                                  aboutappImg,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            })
          ],
        ),
      ),
      bottomNavigationBar:
          Consumer<AboutAppProvider>(builder: (context, value, child) {
        return value.blur == true
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: Platform.isIOS
                        ? const EdgeInsets.only(bottom: 50)
                        : const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Copyright 2022 Scale App',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor().textcolor,
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
