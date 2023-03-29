// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/view_model/menu_view_model/filter_view_model.dart';

import '../../res/provider/profile_provider/user_info_profile_provider.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  // UserProfileProvider userData = UserProfileProvider();
  // final List<String> items = [
  //   'Men',
  //   'Women',
  //   'Both',
  //   'Everyone',
  // ];
  var dropdownvalue;
  bool showDropdown = false;
  String? whoRank = 'Men';
  // bool enablepocket = false;
  bool enableprofilerank = false;
  bool enableshowrank = false;

  ///
  @override
  void initState() {
    filetergetFunction();

    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final userData = Provider.of<UserProfileProvider>(context, listen: false);

    // bool enablepocket = userData.userdata.filter!.isPocket == 0 ? false : true;
    // bool enableprofilerank =
    //     userData.userdata.filter!.isProfileRanked == 0 ? false : true;
    // bool enableshowrank =
    //     userData.userdata.filter!.isShowRank == 0 ? false : true;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 23, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                            'Settings',
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
                    height: 29,
                  ),
                  // Container(
                  //   width: screenwidth,
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //     color: AppColor().whitecolor,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 25),
                  //         child: Text(
                  //           'Pocket',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w600,
                  //             color: AppColor().tealcolor,
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.fromLTRB(0, 17, 18, 17),
                  //         child: FlutterSwitch(
                  //           width: 65.0,
                  //           height: 29.0,
                  //           toggleSize: 20.0,
                  //           showOnOff: true,
                  //           activeTextColor: AppColor().textwhitecolor,
                  //           inactiveTextColor: AppColor().textwhitecolor,
                  //           inactiveColor: AppColor().switchOffcolor,
                  //           activeColor: AppColor().tealcolor,
                  //           value: enablepocket,
                  //           onToggle: (val) {
                  //             setState(() {
                  //               enablepocket = val;
                  //             });
                  //           },
                  //         ),
                  //         // CustomSwitch(
                  //         //   value: enablepocket,
                  //         //   onChanged: (bool val) {
                  //         //     setState(() {
                  //         //       enablepocket = val;
                  //         //     });
                  //         //   },
                  //         // ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(26)),
                      color: AppColor().whitecolor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Allow profile to be ranked',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor().textcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: FlutterSwitch(
                                width: 65.0,
                                height: 29.0,
                                toggleSize: 20.0,
                                showOnOff: true,
                                activeTextColor: AppColor().textwhitecolor,
                                inactiveTextColor: AppColor().textwhitecolor,
                                inactiveColor: AppColor().switchOffcolor,
                                activeColor: AppColor().tealcolor,
                                value: enableprofilerank,
                                onToggle: (val) {
                                  setState(() {
                                    enableprofilerank = val;
                                  });
                                },
                              ),
                              // CustomSwitch(
                              //   value: enableprofilerank,
                              //   //value: userData.userdata.filter!.isProfileRanked == 0 ? enableprofilerank : !enableprofilerank,
                              //   onChanged: (bool val) {
                              //     setState(() {
                              //       enableprofilerank = val;
                              //     });
                              //   },
                              // ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Show Rank',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor().textcolor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: FlutterSwitch(
                                width: 65.0,
                                height: 29.0,
                                toggleSize: 20.0,
                                showOnOff: true,
                                activeTextColor: AppColor().textwhitecolor,
                                inactiveTextColor: AppColor().textwhitecolor,
                                inactiveColor: AppColor().switchOffcolor,
                                activeColor: AppColor().tealcolor,
                                value: enableshowrank,
                                onToggle: (val) {
                                  setState(() {
                                    enableshowrank = val;
                                  });
                                },
                              ),
                              // CustomSwitch(
                              //   value: enableshowrank,
                              //   onChanged: (bool val) {
                              //     setState(() {
                              //       enableshowrank = val;
                              //     });
                              //   },
                              // ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'Who Ranks My Profile',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor().textcolor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: whoRank ==
                                                        'Genderfluid'
                                                    ? const EdgeInsets.fromLTRB(
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
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor()
                                                        .textwhitecolor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 19),
                                                child: Icon(
                                                  FontAwesomeIcons.chevronDown,
                                                  color: AppColor().whitecolor,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                ///////////////////////////////
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.only(left: 15),
                                //       child: Text(
                                //         'Current Rank',
                                //         style: TextStyle(
                                //           fontSize: 16,
                                //           fontWeight: FontWeight.w500,
                                //           color: AppColor().textcolor,
                                //         ),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.fromLTRB(
                                //           0, 0, 60, 0),
                                //       child: Text(
                                //         userData.userdata.rankNumber.toString(),
                                //         style: TextStyle(
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.w500,
                                //           color: AppColor().tealcolor,
                                //           height: 1.5,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                ///////////////////////////////
                                // Text('${userData.userdata.rank.toString()}'),
                                // Text('${userData.userdata.filter?.isPocket.toString()}'),
                                // Text('${userData.userdata.filter?.profilePreference.toString()}'),
                                // Text('${userData.userdata.filter?.isProfileRanked.toString()}'),
                                // Text('${userData.userdata.filter?.isShowRank.toString()}'),
                                // Text('userData.filter.profilePreference.toString()}'),
                                // Text('${userData.filter.isPocket.toString()}'),
                                // Text('${userData.userdata.id.toString()}'),
                                // Text('${userData.userdata.name.toString()}'),
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
                                                ),
                                              ),
                                              SizedBox(
                                                // color: Colors.green,
                                                width: 130,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (whoRank != 'Women') {
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                        whoRank = 'Genderfluid';
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(26)),
                                                  color:
                                                      AppColor().texthintcolor,
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
                                                        whoRank = 'Transwoman';
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
                  )
                ],
              ),
              Consumer<FilterViewModel>(builder: (context, value, child) {
                return PrimaryButtonLoading(
                  buttonText: value.filterloading == false
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
                      print('////////// here start print statement //////');
                      print(whoRank.toString().toLowerCase());
                    }

                    // if (whoRank.toString().toLowerCase() == 'women') {
                    //   whoRank = 'woman';
                    // }
                    debugPrint('$whoRank');

                    if (whoRank.toString().toLowerCase() == 'women') {
                      whoRank = 'woman';
                    }
                    if (whoRank.toString().toLowerCase() == 'men') {
                      whoRank = 'man';
                    }

                    /// here to do
                    FormData data = FormData.fromMap({
                      /// will be replaced
                      // 'is_pocket': enablepocket == true ? 1 : 0,
                      'is_profile_ranked': enableprofilerank == true ? 1 : 0,
                      'profile_preference': whoRank.toString().toLowerCase(),
                      'is_show_rank': enableshowrank == true ? 1 : 0,
                    });

                    value.filterApi(data, context);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> filetergetFunction() async {
    final userData = Provider.of<UserProfileProvider>(context, listen: false);
    if (userData.userdata.filter?.isProfileRanked == 0) {
      enableprofilerank = false;
    } else {
      debugPrint('enableprofilerank');
      debugPrint('${userData.userdata.filter?.isProfileRanked.toString()}');
      enableprofilerank = true;
    }

    ///
    // if (userData.userdata.filter?.isPocket == 0) {
    //   enablepocket = false;
    // } else {
    //   debugPrint('enablepocket');
    //   enablepocket = true;
    // }

    ///
    if (userData.userdata.filter?.isShowRank == 0) {
      enableshowrank = false;
    } else {
      debugPrint('enablepocket');
      enableshowrank = true;
    }

    ///

    debugPrint('/////////////////');
    debugPrint('$whoRank');

    if (userData.userdata.filter?.profilePreference != '') {
      whoRank = '${userData.userdata.filter?.profilePreference}';
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
    // whoRank = 'pp';
    setState(() {});
  }
}
