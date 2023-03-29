// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/provider/profile_provider/edit_profile_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/view_model/menu_view_model/match_preference_view_model.dart';

class MatchPrefrencesView extends StatefulWidget {
  const MatchPrefrencesView({Key? key}) : super(key: key);

  @override
  State<MatchPrefrencesView> createState() => _MatchPrefrencesViewState();
}

class _MatchPrefrencesViewState extends State<MatchPrefrencesView> {
  double maxDistance = 20.0;
  var rangeValue = const RangeValues(18.0, 100.0);
  // final List<String> items = [
  //   'man',
  //   'momen',
  //   'Both',
  // ];
  var dropdownvalue;
  bool showDropdown = false;
  String? whoRank = 'Men';
  bool enablepocket = false;

  ///
  @override
  void initState() {
    getUserOldDataFunction();

    super.initState();
  }

  ///

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    // final matchpreferenceViewModel =
    //     Provider.of<MatchPreferenceViewModel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 23, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            // color: Colors.red,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 3,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColor().appIconcolor,
                              size: 28,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Search Preference',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor().textcolor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: screenwidth,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: AppColor().whitecolor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
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
                            padding: const EdgeInsets.fromLTRB(0, 17, 18, 17),
                            child: FlutterSwitch(
                              width: 65.0,
                              height: 29.0,
                              toggleSize: 20.0,
                              showOnOff: true,
                              activeTextColor: AppColor().textwhitecolor,
                              inactiveTextColor: AppColor().textwhitecolor,
                              inactiveColor: AppColor().switchOffcolor,
                              activeColor: AppColor().tealcolor,
                              value: enablepocket,
                              onToggle: (val) {
                                setState(() {
                                  enablepocket = val;
                                });
                              },
                            ),
                            // CustomSwitch(
                            //   value: enablepocket,
                            //   onChanged: (bool val) {
                            //     setState(() {
                            //       enablepocket = val;
                            //     });
                            //   },
                            // ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenwidth,
                      padding: const EdgeInsets.fromLTRB(
                        14,
                        12,
                        0,
                        15,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Maximum Distance',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor().tealcolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SliderTheme(
                            data: ThemeData.dark().sliderTheme.copyWith(
                                  valueIndicatorColor:
                                      AppColor().tealcolor.withOpacity(0.25),
                                  valueIndicatorTextStyle: const TextStyle(
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                            child: Slider(
                              value: maxDistance,
                              min: 1.0,
                              max: 20000.0,
                              divisions: 100,
                              activeColor: AppColor().tealcolor,
                              inactiveColor: AppColor().greylightcolor,
                              label: '${maxDistance.round()}',
                              onChanged: (double val) {
                                setState(() {
                                  maxDistance = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColor().tealcolor.withOpacity(0.15),
                              border: Border.all(
                                color: AppColor().tealcolor,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Text(
                                '${maxDistance.toString().substring(
                                      0,
                                      maxDistance.toString().indexOf('.'),
                                    )} mi',
                                // ageValue.toString().substring(
                                //     0, ageValue.toString().indexOf('.')),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: screenwidth,
                      padding: const EdgeInsets.fromLTRB(
                        14,
                        19,
                        0,
                        25,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Show Me',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor().tealcolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Text(
                                          'Show me result',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor().textcolor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showDropdown = true;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(26)),
                                              color: AppColor().tealcolor,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: whoRank ==
                                                          'Genderfluid'
                                                      ? const EdgeInsets
                                                              .fromLTRB(
                                                          15, 5, 20, 5)
                                                      : whoRank == 'Transwoman'
                                                          ? const EdgeInsets
                                                                  .fromLTRB(
                                                              15, 5, 10, 5)
                                                          : const EdgeInsets
                                                                  .fromLTRB(
                                                              15, 5, 10, 5),
                                                  child: Text(
                                                    whoRank.toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor()
                                                          .textwhitecolor,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 19),
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .chevronDown,
                                                    color:
                                                        AppColor().whitecolor,
                                                    size: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              showDropdown == false
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 27),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(26)),
                                              color: AppColor().whitecolor,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  // color: Colors.red,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank != 'Men') {
                                                          whoRank = 'Men';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 10, 5),
                                                      child: Text(
                                                        'Men',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.green,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Women') {
                                                          whoRank = 'Women';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Women',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.yellow,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank != 'Both') {
                                                          whoRank = 'Both';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Both',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.blue,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Everyone') {
                                                          whoRank = 'Everyone';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Everyone',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.pink,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Agender') {
                                                          whoRank = 'Agender';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Agender',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.green,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Bigender') {
                                                          whoRank = 'Bigender';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Bigender',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.yellow,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Genderfluid') {
                                                          whoRank =
                                                              'Genderfluid';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Genderfluid',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.blue,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Transman') {
                                                          whoRank = 'Transman';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Transman',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 1,
                                                  width: 110,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    color: AppColor()
                                                        .texthintcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  // color: Colors.blue,
                                                  width: 130,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (whoRank !=
                                                            'Transwoman') {
                                                          whoRank =
                                                              'Transwoman';
                                                        }
                                                        showDropdown = false;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 0, 5),
                                                      child: Text(
                                                        'Transwoman',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenwidth,
                      padding: const EdgeInsets.fromLTRB(
                        14,
                        19,
                        0,
                        25,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Age Range',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor().tealcolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: AppColor().tealcolor.withOpacity(0.15),
                                  border: Border.all(
                                    color: AppColor().tealcolor,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    rangeValue.start.toString().substring(
                                        0,
                                        rangeValue.start
                                            .toString()
                                            .indexOf('.')),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'To',
                                // ageValue.toString().substring(
                                //     0, ageValue.toString().indexOf('.')),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: AppColor().tealcolor.withOpacity(0.15),
                                  border: Border.all(
                                    color: AppColor().tealcolor,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    rangeValue.end.toString().substring(0,
                                        rangeValue.end.toString().indexOf('.')),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          RangeSlider(
                            min: 18.0,
                            max: 100.0,
                            onChanged: (RangeValues newRange) {
                              setState(() {
                                rangeValue = newRange;
                              });
                            },
                            values: rangeValue,
                            activeColor: AppColor().tealcolor,
                            inactiveColor: AppColor().greylightcolor,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Consumer<MatchPreferenceViewModel>(
                              builder: (context, value, child) {
                            return PrimaryButtonLoading(
                              buttonText: value.preferenceloading == false
                                  ? Text(
                                      'Done',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor().textwhitecolor,
                                      ),
                                    )
                                  : customcircularprogress(
                                      passcolor: AppColor().whitecolor,
                                    ),
                              passOnTap: () async {
                                if (kDebugMode) {
                                  print(
                                      '////////// here start print statement //////');
                                  print(whoRank.toString().toLowerCase());
                                  print(enablepocket.toString().toLowerCase());
                                }

                                if (whoRank.toString().toLowerCase() ==
                                    'women') {
                                  whoRank = 'woman';
                                }
                                if (whoRank.toString().toLowerCase() == 'men') {
                                  whoRank = 'man';
                                }

                                /// here to do
                                FormData data = FormData.fromMap({
                                  /// is replaced
                                  'is_pocket': enablepocket == true ? 1 : 0,
                                  'age_range[0]': rangeValue.start
                                      .toString()
                                      .substring(
                                          0,
                                          rangeValue.start
                                              .toString()
                                              .indexOf('.')),
                                  'age_range[1]': rangeValue.end
                                      .toString()
                                      .substring(
                                          0,
                                          rangeValue.end
                                              .toString()
                                              .indexOf('.')),
                                  'gender': whoRank.toString().toLowerCase(),
                                  // 'distance': 10,
                                  'distance': int.parse(
                                    maxDistance.toString().substring(
                                        0, maxDistance.toString().indexOf('.')),
                                  ),
                                });

                                value.matchPreferenceApi(data, context);
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<MatchPrefrencesProvider>(builder: (context, value, child) {
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
                                Center(
                                  child: Icon(
                                    FontAwesomeIcons.solidHeart,
                                    color: AppColor().whitecolor,
                                    size: 65,
                                  ),
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
    );
  }

  /////////////// Get User OLD Data ///////////////////////
  Future<void> getUserOldDataFunction() async {
    final userData = Provider.of<UserProfileProvider>(context, listen: false);
    if (userData.userdata.matchPreference!.distance != 0) {
      debugPrint('//////////// distance ////////////');
      debugPrint(userData.userdata.matchPreference!.distance.toString());
      maxDistance = userData.userdata.matchPreference!.distance!.toDouble();
    }
    if (userData.userdata.matchPreference?.gender != '') {
      whoRank = '${userData.userdata.matchPreference?.gender}';
      if (whoRank == 'man') {
        whoRank = 'men';
      }
      if (whoRank == 'woman') {
        debugPrint('$whoRank');
        whoRank = 'women';
      }
      String? whoRank1 = whoRank;
      whoRank = whoRank1.toString().substring(0, 1).toUpperCase() +
          whoRank1!.substring(1);
    }

    if (userData.userdata.matchPreference!.ageRange!.isNotEmpty) {
      var firstRangeValNow =
          userData.userdata.matchPreference!.ageRange![0].toString();
      var firstRangeValNow2 =
          userData.userdata.matchPreference!.ageRange![1].toString();
      if (int.parse(firstRangeValNow) < 18) {
        firstRangeValNow = '18';
      }
      // var firstRangeVal = userData.userdata.matchPreference!.ageRange!
      //     .toString()[0]
      //     .toString()
      //     .replaceAll('"', '');
      // var secondRangeVal = userData.userdata.matchPreference!.ageRange!
      //     .toString()[1]
      //     .toString()
      //     .replaceAll('"', '');
      debugPrint('firstRangeVal $firstRangeValNow');
      debugPrint('secondRangeVal $firstRangeValNow2');
      rangeValue = RangeValues(
          int.parse(firstRangeValNow.toString()).toDouble(),
          int.parse(firstRangeValNow2.toString()).toDouble());
    }

    if (userData.userdata.matchPreference?.isPocket == 0) {
      enablepocket = false;
    } else {
      debugPrint('enablepocket');
      debugPrint(enablepocket.toString());
      enablepocket = true;
    }

    // rangeValue = const RangeValues(10.0, 90.0);
    // if (userData.userdata.gender != '') {
    //   gender = userData.userdata.gender!;
    // }
    // if (userData.userdata.age != 0) {
    //   age = userData.userdata.age!.toString();
    //   debugPrint('age is a $age');
    // }
    // imageViewModel.removeImage(true);
    // imageViewModel.removeGalleryImage(true);
  }
  /////////////// Get User OLD Data ///////////////////////

}
