import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/home_user_list_model/other_user_list_model.dart';
import 'package:scaleapp/res/provider/home_provider/slider_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/give_rank_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/other_user_like_view_model.dart';
import 'dart:math' show cos, sqrt, asin;

class OtherProfileInfoList extends StatelessWidget {
  final Users users;
  final int passindex;

  const OtherProfileInfoList(
      {super.key, required this.users, required this.passindex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final userSelfData =
        Provider.of<UserProfileProvider>(context, listen: false);
    final screenwidth = MediaQuery.of(context).size.width;
    final otherUserLikeProvider =
        Provider.of<OtherUserFollowViewModel>(context, listen: false);
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    // String blackVal = 'black';
    // String bronzeVal = 'bronze';
    // String goldVal = 'gold';
    // String rosegoldVal = 'rose gold';
    // String platinumVal = 'platinum';
    // String platinumdimeVal = 'platinum dime';

    ///

    ///
    /// If Pocket is On and Other User show rank OFF ///
    if (userSelfData.userdata.matchPreference!.isPocket == 1 &&
        users.filter!.isShowRank == 0) {
      // debugPrint('${userSelfData.userdata.matchPreference!.isPocket}');
      // debugPrint('${users.filter!.isShowRank}');
      // debugPrint('${users.name}');
      return Container();
    } else {
      //     /// Else ///
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  users.profileImage != null
                      ? Container(
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: users.filter!.isShowRank == 0
                                  ? Border.all(width: 0)
                                  : Border.all(
                                      //color: AppColor().walkthroughthreeContainerBordercolor,
                                      color:
                                          // users.rankNumber! < 5
                                          //     ? Colors.black
                                          //     : users.rankNumber! > 4 &&
                                          //             users.rankNumber! < 7
                                          //         ? AppColor().bronzeColor
                                          // :
                                          (users.rankNumber >= 0 &&
                                                  users.rankNumber < 5.0)
                                              ? AppColor().blackColor
                                              : (users.rankNumber >= 5 &&
                                                      users.rankNumber <= 6.9)
                                                  ? AppColor().bronzeColor
                                                  : (users.rankNumber >= 7.0 &&
                                                          users.rankNumber <=
                                                              7.9)
                                                      ? AppColor().goldColor
                                                      : (users.rankNumber >=
                                                                  8.0 &&
                                                              users.rankNumber <=
                                                                  8.9)
                                                          ? AppColor()
                                                              .rosegoldColor
                                                          : (users.rankNumber >=
                                                                      9.0 &&
                                                                  users.rankNumber <
                                                                      9.5)
                                                              ? AppColor()
                                                                  .platinumColor
                                                              : (users.rankNumber >=
                                                                          9.5 &&
                                                                      users.rankNumber <=
                                                                          10)
                                                                  ? AppColor()
                                                                      .platinumDimColor
                                                                  : AppColor()
                                                                      .bronzeColor,
                                      width: 6.0,
                                    )),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.network(
                              users.profileImage!,
                              width: size.width - 62,
                              height: 320,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: users.filter!.isShowRank == 0
                                  ? Border.all(width: 0)
                                  : Border.all(
                                      //color: AppColor().walkthroughthreeContainerBordercolor,
                                      color:
                                          //  users.rankNumber! < 5
                                          //     ? Colors.black
                                          //     : users.rankNumber! > 4 &&
                                          //             users.rankNumber! < 7
                                          //         ? AppColor().bronzeColor
                                          (users.rankNumber >= 0 &&
                                                  users.rankNumber < 5.0)
                                              ? AppColor().blackColor
                                              : (users.rankNumber >= 5 &&
                                                      users.rankNumber <= 6.9)
                                                  ? AppColor().bronzeColor
                                                  : (users.rankNumber >= 7.0 &&
                                                          users.rankNumber <=
                                                              7.9)
                                                      ? AppColor().goldColor
                                                      : (users.rankNumber >=
                                                                  8.0 &&
                                                              users.rankNumber <=
                                                                  8.9)
                                                          ? AppColor()
                                                              .rosegoldColor
                                                          : (users.rankNumber >=
                                                                      9.0 &&
                                                                  users.rankNumber <
                                                                      9.5)
                                                              ? AppColor()
                                                                  .platinumColor
                                                              : (users.rankNumber >=
                                                                          9.5 &&
                                                                      users.rankNumber <=
                                                                          10)
                                                                  ? AppColor()
                                                                      .platinumDimColor
                                                                  : AppColor()
                                                                      .bronzeColor,
                                      width: 6.0,
                                    )),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              logo,
                              width: size.width - 62,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ],
              ),
              Container(
                transform: Matrix4.translationValues(0, -25, 0),
                child: users.filter!.isShowRank == 0
                    ? Container()
                    : (users.rankNumber >= 0 && users.rankNumber < 5)
                        ? Container()
                        : Image.asset(
                            (users.rankNumber >= 5 && users.rankNumber <= 6.9)
                                ? scale6
                                : (users.rankNumber >= 7.0 &&
                                        users.rankNumber <= 7.9)
                                    ? scale7
                                    : (users.rankNumber >= 8 &&
                                            users.rankNumber <= 8.9)
                                        ? scale8
                                        : (users.rankNumber >= 9.0 &&
                                                users.rankNumber < 9.5)
                                            ? scale9
                                            : (users.rankNumber >= 9.5 &&
                                                    users.rankNumber <= 10)
                                                ? scale10
                                                : scale6,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // users.id.toString() +
                      users.name.toString().split(' ').first,
                      //users.rank!,

                      // + users.id.toString()

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor().textcolor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    // Text(
                    //   users.age != null
                    //       ? 'Age: ${users.age.toString()}'
                    //       : 'Age: 20',
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w400,
                    //     color: AppColor().textcolor,
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              users.filter!.isShowRank == 0
                  ? Container()
                  : Column(
                      children: [
                        Center(
                          child: Container(
                            transform: Matrix4.translationValues(0, 10, 0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              //color: AppColor().containercolor.withOpacity(0.9),
                              color:
                                  // users.rankNumber! < 5
                                  //     ? Colors.black
                                  //     : users.rankNumber! > 4 && users.rankNumber! < 7
                                  //         ? AppColor().bronzeColor
                                  (users.rankNumber >= 0 &&
                                          users.rankNumber < 5.0)
                                      ? AppColor().blackColor
                                      : (users.rankNumber >= 5 &&
                                              users.rankNumber <= 6.9)
                                          ? AppColor().bronzeColor
                                          : (users.rankNumber >= 7.0 &&
                                                  users.rankNumber <= 7.9)
                                              ? AppColor().goldColor
                                              : (users.rankNumber >= 8.0 &&
                                                      users.rankNumber <= 8.9)
                                                  ? AppColor().rosegoldColor
                                                  : (users.rankNumber >= 9.0 &&
                                                          users.rankNumber <
                                                              9.5)
                                                      ? AppColor().platinumColor
                                                      : (users.rankNumber >=
                                                                  9.5 &&
                                                              users.rankNumber <=
                                                                  10)
                                                          ? AppColor()
                                                              .platinumDimColor
                                                          : AppColor()
                                                              .bronzeColor,
                            ),
                            child: Text(
                              users.rankNumber.toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor().textwhitecolor,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            transform: Matrix4.translationValues(0, -48, 0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              color: AppColor().tealcolor,
                            ),
                            child: Text(
                              'Rank',
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
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  // calculateDis(
                  //   passlat1: '',
                  //   passlon1: '',
                  //   passlat2: '',
                  //   passlon2: '',
                  // );
                  ///
                  // debugPrint(userSelfData.userdata.matchPreference!.isPocket
                  //     .toString());
                  // debugPrint(users.filter!.isShowRank.toString());
                  Navigator.pushNamed(
                    context,
                    RoutesName.morepics,
                    arguments: {
                      'userId': users.id,
                      'userName': users.name,
                      'userProfile': users.profileImage ?? 'null',
                      'chatButton': false,
                    },
                  );
                  // ge.Get.toNamed(
                  //   RoutesName.morepics,
                  //   arguments: {
                  //     'userId': 123,
                  //   },
                  // );
                },
                child: Column(
                  children: [
                    Center(
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: AppColor().tealcolor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'more info',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor().textcolor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          users.filter!.isProfileRanked == 0
              ? const SizedBox(
                  height: 20,
                )
              : users.filter!.profilePreference == 'everyone'
                  ? rankMe1to10()
                  : users.filter!.profilePreference == 'both' &&
                              userSelfData.userdata.gender == 'man' ||
                          userSelfData.userdata.gender == 'woman'
                      ? rankMe1to10()
                      : users.filter!.profilePreference ==
                              userSelfData.userdata.gender
                          ? rankMe1to10()
                          : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (otherUserLikeProvider.likeloading == true) {
                    debugPrint('wait');
                  } else {
                    // debugPrint(users.isLikedByMe.toString());
                    // debugPrint('other ${users.filter!.profilePreference}');
                    // debugPrint('self ${userSelfData.userdata.gender}');

                    FormData data = FormData.fromMap({
                      'like_to': users.id,
                    });
                    otherUserLikeProvider.otherUserLikeApi(
                      context: context,
                      data: data,
                      herlikedToUserID: users.id,
                      herelikedToUserName: users.name.toString().toLowerCase(),
                      herelikedToUserProfile: users.profileImage ?? 'null',
                      herelikedByUserName:
                          userSelfData.userdata.name.toString().toLowerCase(),
                      herelikedByUserProfile:
                          userSelfData.userdata.profileImage ?? 'null',
                    );
                  }
                },
                child: SizedBox(
                  height: 67,
                  width: 67,
                  child: Image.asset(
                    walkthroughthreeImgLike,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: users.filter!.isProfileRanked == 0
                    ? 30
                    : users.filter!.profilePreference == 'everyone'
                        ? 10
                        : users.filter!.profilePreference == 'both' &&
                                    userSelfData.userdata.gender == 'man' ||
                                userSelfData.userdata.gender == 'woman'
                            ? 10
                            : users.filter!.profilePreference ==
                                    userSelfData.userdata.gender
                                ? 10
                                : 30,
              ),
              users.filter!.isProfileRanked == 0
                  ? Container()
                  // : users.filter!.isShowRank == 0
                  //     ? Container()
                  ///
                  // : users.filter!.profilePreference !=
                  //         userSelfData.userdata.filter!.profilePreference
                  //     ? const SizedBox(
                  //         height: 20,
                  //       )
                  : users.filter!.profilePreference == 'everyone'
                      ? sliderValinCenter(passindex)
                      : users.filter!.profilePreference == 'both' &&
                                  userSelfData.userdata.gender == 'man' ||
                              userSelfData.userdata.gender == 'woman'
                          ? sliderValinCenter(passindex)
                          : users.filter!.profilePreference ==
                                  userSelfData.userdata.gender
                              ? sliderValinCenter(passindex)
                              : Container(),
              SizedBox(
                width: users.filter!.isProfileRanked == 0
                    ? 30
                    : users.filter!.profilePreference == 'everyone'
                        ? 10
                        : users.filter!.profilePreference == 'both' &&
                                    userSelfData.userdata.gender == 'man' ||
                                userSelfData.userdata.gender == 'woman'
                            ? 10
                            : users.filter!.profilePreference ==
                                    userSelfData.userdata.gender
                                ? 10
                                : 30,
              ),
              GestureDetector(
                onTap: () {
                  if (otherUserLikeProvider.likeloading == true) {
                    debugPrint('wait');
                  } else {
                    FormData data = FormData.fromMap({
                      'unlike_to': users.id,
                    });
                    otherUserLikeProvider.otherUserunLikeApi(context, data);
                  }
                },
                child: SizedBox(
                  height: 67,
                  width: 67,
                  child: Image.asset(
                    walkthroughthreeImgUnlike,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          users.filter!.isProfileRanked == 0
              ? Container()
              : users.filter!.profilePreference == 'everyone'
                  ? moveSlider(passindex)
                  : users.filter!.profilePreference == 'both' &&
                              userSelfData.userdata.gender == 'man' ||
                          userSelfData.userdata.gender == 'woman'
                      ? moveSlider(passindex)
                      : users.filter!.profilePreference ==
                              userSelfData.userdata.gender
                          ? moveSlider(passindex)
                          : Container(),
          users.filter!.isProfileRanked == 0
              ? Container()
              : users.filter!.profilePreference == 'everyone'
                  ? Align(
                      alignment: Alignment.center,
                      child: Consumer<GiveRankViewModel>(
                          builder: (context, valueofViewModel, child) {
                        return Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: SecondaryButton(
                                width: 120,
                                buttonColor: AppColor().tealcolor,
                                textwidget:
                                    // valueofViewModel.giverankloading == true
                                    //     ? customcircularprogress(
                                    //         passcolor: AppColor().blackcolor,
                                    //         passSize: 15.0,
                                    //       )
                                    //     :
                                    Text(
                                  valueofViewModel.giverankloading == true
                                      ? ''
                                      : 'Confirm',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor().textwhitecolor,
                                  ),
                                ),
                                passOnTap: () {
                                  FormData data = FormData.fromMap({
                                    'rank_to': users.id,
                                    'rank': sliderProvider.rankList[passindex],
                                  });

                                  valueofViewModel.giveRankApi(data, context);
                                },
                              ),
                            ),
                            Container(
                              height: 34,
                              // color: Colors.amber,
                              alignment: Alignment.center,
                              child: valueofViewModel.giverankloading == true
                                  ? customcircularprogress(
                                      passcolor: AppColor().whitecolor,
                                      passSize: 20,
                                    )
                                  : Container(),
                            )
                          ],
                        );
                      }),
                    )
                  : users.filter!.profilePreference == 'both' &&
                              userSelfData.userdata.gender == 'man' ||
                          userSelfData.userdata.gender == 'woman'
                      ? Align(
                          alignment: Alignment.center,
                          child: Consumer<GiveRankViewModel>(
                              builder: (context, valueofViewModel, child) {
                            return SecondaryButton(
                              width: 120,
                              buttonColor: AppColor().tealcolor,
                              textwidget:
                                  valueofViewModel.giverankloading == true
                                      ? customcircularprogress(
                                          passcolor: AppColor().blackcolor,
                                        )
                                      : Text(
                                          'Confirm',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor().textwhitecolor,
                                          ),
                                        ),
                              passOnTap: () {
                                FormData data = FormData.fromMap({
                                  'rank_to': users.id,
                                  'rank': int.parse(sliderProvider.rankValue
                                      .toString()
                                      .substring(
                                        0,
                                        sliderProvider.rankValue
                                            .toString()
                                            .indexOf('.'),
                                      )),
                                });

                                valueofViewModel.giveRankApi(data, context);
                              },
                            );
                          }),
                        )
                      : users.filter!.profilePreference ==
                              userSelfData.userdata.gender
                          ? Align(
                              alignment: Alignment.center,
                              child: Consumer<GiveRankViewModel>(
                                  builder: (context, valueofViewModel, child) {
                                return SecondaryButton(
                                  width: 120,
                                  buttonColor: AppColor().tealcolor,
                                  textwidget:
                                      valueofViewModel.giverankloading == true
                                          ? customcircularprogress(
                                              passcolor: AppColor().blackcolor,
                                            )
                                          : Text(
                                              'Confirm',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    AppColor().textwhitecolor,
                                              ),
                                            ),
                                  passOnTap: () {
                                    FormData data = FormData.fromMap({
                                      'rank_to': users.id,
                                      'rank': int.parse(sliderProvider.rankValue
                                          .toString()
                                          .substring(
                                            0,
                                            sliderProvider.rankValue
                                                .toString()
                                                .indexOf('.'),
                                          )),
                                    });

                                    valueofViewModel.giveRankApi(data, context);
                                  },
                                );
                              }),
                            )
                          : Container(),

          // Stack(
          //   children: [
          //     Container(
          //       height: 36,
          //       color: Colors.transparent,
          //       child: Container(
          //         width: screenwidth,
          //         height: 5.0,
          //         margin: const EdgeInsets.fromLTRB(46, 15.5, 46, 15.5),
          //         decoration: BoxDecoration(
          //           borderRadius: const BorderRadius.all(Radius.circular(100)),
          //           color: AppColor().greylightcolor,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 173),
          //       child: Container(
          //         padding: const EdgeInsets.all(3),
          //         height: 36,
          //         width: 36,
          //         decoration: BoxDecoration(
          //           borderRadius: const BorderRadius.all(Radius.circular(100)),
          //           color: AppColor().whitecolor,
          //         ),
          //         child: Transform.rotate(
          //           angle: pi / 2,
          //           child: Icon(
          //             Icons.menu,
          //             color: AppColor().walkthroughtwoIconcolor,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SecondaryButton(
                width: 95,
                buttonColor: AppColor().tealcolor,
                textwidget: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 8),
                      padding: const EdgeInsets.only(bottom: 2),
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColor().whitecolor,
                        border: Border.all(
                          color: AppColor().whitecolor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'i',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColor().tealcolor,
                        ),
                      ),
                    ),
                    Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor().textwhitecolor,
                      ),
                    ),
                  ],
                ),
                passOnTap: () {
                  Navigator.pushNamed(context, RoutesName.aboutapp, arguments: {
                    'homepage': true,
                  });
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   RoutesName.logIn,
                  //   (route) => false,
                  // );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              SecondaryButton(
                width: screenwidth - 170,
                buttonColor: AppColor().redcolor,
                textwidget: Text(
                  'Report User',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor().textwhitecolor,
                  ),
                ),
                passOnTap: () {
                  Navigator.pushNamed(context, RoutesName.reportUser,
                      arguments: {
                        'userId': users.id,
                      });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ]),
      );
    }
  }

  Widget sliderValinCenter(var index) {
    return Consumer<SliderProvider>(
        builder: (context, valueofSliderprovider, child) {
      int val = int.parse(valueofSliderprovider.rankList[index].toString());
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              //color: AppColor().greylightcolor,
              color: val <= 4
                  ? AppColor().blackColor
                  : val > 4 && val <= 6
                      ? AppColor().bronzeColor
                      : val <= 7 && val > 6
                          ? AppColor().goldColor
                          : val <= 8 && val > 7
                              ? AppColor().rosegoldColor
                              : val <= 9 && val > 8
                                  ? AppColor().platinumColor
                                  : val <= 10 && val > 9
                                      ? AppColor().platinumDimColor
                                      : AppColor().bronzeColor,
              border: Border.all(
                color: AppColor().walkthroughthreeContainerBordercolor,
                width: 1.0,
              )),
          child: Text(
            valueofSliderprovider.rankList[index].toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ));
    });
  }

  ///
  Widget moveSlider(var index) {
    return Consumer<SliderProvider>(
        builder: (context, valueofSliderprovider, child) {
      return SliderTheme(
        data: ThemeData.dark().sliderTheme.copyWith(
              valueIndicatorColor: AppColor().tealcolor.withOpacity(0.25),
              valueIndicatorTextStyle: const TextStyle(
                backgroundColor: Colors.transparent,
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Slider(
            //value: valueofSliderprovider.rankValue,
            value: valueofSliderprovider.rankList[index].toDouble(),
            min: 1.0,
            max: 10.0,
            divisions: 100,
            activeColor: AppColor().tealcolor,
            inactiveColor: AppColor().greylightcolor,
            label: '${valueofSliderprovider.rankList[index].round()}',
            //label: '0',
            onChanged: (double val) {
              //valueofSliderprovider.setSliderVal(val);
              valueofSliderprovider.setSliderListIndexVal(val, index);
            },
          ),
        ),
      );
    });
  }

  ///////////////////////  Lat Long ///////////////
  ///
  Future calculateDis({
    passlat1,
    passlon1,
    passlat2,
    passlon2,
  }) async {
    double calculateDistance(lat1, lon1, lat2, lon2) {
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      return 12742 * asin(sqrt(a));
    }

    double totalDistance =
        calculateDistance(26.196435, 78.197535, 26.197195, 78.196408);

    debugPrint(totalDistance.toString());
  }
}

Widget rankMe1to10() {
  return Container(
    padding: const EdgeInsets.only(top: 30, bottom: 20),
    alignment: Alignment.center,
    child: Text(
      'Rank Me 1 - 10',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColor().textcolor,
      ),
    ),
  );
}
