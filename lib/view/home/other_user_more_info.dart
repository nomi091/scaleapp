// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/data/responce/status.dart';
import 'package:scaleapp/model/home_user_list_model/user_more_info_model.dart';
import 'package:scaleapp/res/components/home_other_profile_component/like_matching_component.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/other_user_like_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/other_user_more_info_view_model.dart';
import 'package:scaleapp/view_model/services/firebase_methods.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MorePicsScreen extends StatefulWidget {
  final int userId;
  final bool chatButton;
  final String userName;
  final String userProfile;
  const MorePicsScreen({
    super.key,
    required this.userId,
    required this.chatButton,
    required this.userName,
    required this.userProfile,
  });

  @override
  State<MorePicsScreen> createState() => _MorePicsScreenState();
}

class _MorePicsScreenState extends State<MorePicsScreen> {
  OtherUserMoreInformationViewModel otherUserMoreInformationViewModel =
      OtherUserMoreInformationViewModel();
  FireBaseFunctions fireBaseFunctions = FireBaseFunctions();
  @override
  void initState() {
    otherUserMoreInformationViewModel.otheruserMoreInfoApi(
        context, widget.userId);
    super.initState();
  }

  double maxDistance = 1.0;
  final ItemScrollController _scrollController = ItemScrollController();

  ///
  final itemKey0 = GlobalKey();
  final itemKey1 = GlobalKey();
  final itemKey2 = GlobalKey();
  final itemKey3 = GlobalKey();
  final itemKey4 = GlobalKey();
  final itemKey5 = GlobalKey();
  Future scrollToItem() async {
    // debugPrint('hiiii');
    if (maxDistance.round() == 1) {
      debugPrint('hiiii 1111111111');
      final context = itemKey1.currentContext!;
      await Scrollable.ensureVisible(context);
    } else if (maxDistance.round() == 2) {
      debugPrint('hiiii 222222');
      final context = itemKey2.currentContext!;
      await Scrollable.ensureVisible(context);
    } else if (maxDistance.round() == 3) {
      debugPrint('hiiii 333333');
      final context = itemKey3.currentContext!;
      await Scrollable.ensureVisible(context);
    } else if (maxDistance.round() == 4) {
      debugPrint('hiiii 333333');
      final context = itemKey4.currentContext!;
      await Scrollable.ensureVisible(context);
    } else if (maxDistance.round() == 5) {
      debugPrint('hiiii 333333');
      final context = itemKey5.currentContext!;
      await Scrollable.ensureVisible(context);
    } else if (maxDistance.round() == 6) {
      debugPrint('hiiii 333333');
      final context = itemKey5.currentContext!;
      await Scrollable.ensureVisible(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Users users;
    String blackVal = 'black';
    String bronzeVal = 'bronze';
    String goldVal = 'gold';
    String rosegoldVal = 'rose gold';
    String platinumVal = 'platinum';
    String platinumdimeVal = 'platinum dime';
    final screenwidth = MediaQuery.of(context).size.width;
    final userSelfData =
        Provider.of<UserProfileProvider>(context, listen: false);
    // final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: AppColor().whispercolor,
      body: Stack(
        children: [
          SafeArea(
            child: ChangeNotifierProvider<OtherUserMoreInformationViewModel>(
              create: (BuildContext context) =>
                  otherUserMoreInformationViewModel,
              child: Consumer<OtherUserMoreInformationViewModel>(
                  builder: (context, valueofViewModel, _) {
                switch (valueofViewModel.otherusermoreinfoData.status) {
                  case Status.LOADING:
                    return const Center(child: Text('Processing...'));
                  case Status.ERROR:
                    return Text(valueofViewModel.otherusermoreinfoData.message
                        .toString());

                  default:
                    users = valueofViewModel.otherusermoreinfoData.data!.users!;
                    return SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 5, bottom: 30),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColor().appIconcolor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 320,
                                child: valueofViewModel.otherusermoreinfoData
                                        .data!.users!.images!.isEmpty
                                    ? ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        child: FadeInImage(
                                          placeholder: const AssetImage(
                                              allnotificationImg),
                                          image: NetworkImage(valueofViewModel
                                              .otherusermoreinfoData
                                              .data!
                                              .users!
                                              .profileImage
                                              .toString()),
                                          fit: BoxFit.fill,
                                          imageErrorBuilder:
                                              (context, object, trace) {
                                            return Image.asset(
                                              logo,
                                              height: 320,
                                              width: screenwidth - 50,
                                              fit: BoxFit.fill,
                                            );
                                          },
                                          height: 320,
                                          width: screenwidth - 50,
                                        ),
                                      )
                                    // ClipRRect(
                                    //     borderRadius: const BorderRadius.all(
                                    //       Radius.circular(15),
                                    //     ),
                                    //     child: Image.asset(
                                    //       logo,
                                    //       width: screenwidth - 50,
                                    //       height: 300,
                                    //       fit: BoxFit.fill,
                                    //     ),
                                    //   )
                                    // const Center(child: Text('No Image Found'))
                                    : ScrollablePositionedList.builder(
                                        itemScrollController: _scrollController,
                                        // primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: valueofViewModel
                                            .otherusermoreinfoData
                                            .data!
                                            .users!
                                            .images!
                                            .length,
                                        // separatorBuilder:
                                        //     (BuildContext context, int index) =>
                                        //         Divider(indent: screenwidth * 0.10),
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Container(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          // key: index == 0
                                          //     ? itemKey0
                                          //     : index == 1
                                          //         ? itemKey1
                                          //         : index == 2
                                          //             ? itemKey2
                                          //             : index == 3
                                          //                 ? itemKey3
                                          //                 : index == 4
                                          //                     ? itemKey4
                                          //                     : itemKey5,
                                          child: images(
                                              context,
                                              screenwidth,
                                              valueofViewModel
                                                  .otherusermoreinfoData
                                                  .data!
                                                  .users!
                                                  .images![index]
                                                  .url
                                                  .toString()),
                                        ),
                                      ),
                              ),
                              valueofViewModel.otherusermoreinfoData.data!
                                      .users!.images!.isEmpty
                                  ? Container()
                                  : valueofViewModel.otherusermoreinfoData.data!
                                              .users!.images!.length ==
                                          1
                                      ? Container()
                                      : SliderTheme(
                                          data: ThemeData.dark()
                                              .sliderTheme
                                              .copyWith(
                                                valueIndicatorColor:
                                                    Colors.transparent,
                                                valueIndicatorTextStyle:
                                                    const TextStyle(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                              ),
                                          child: Slider(
                                            value: maxDistance,
                                            min: 1.0,
                                            max: valueofViewModel
                                                .otherusermoreinfoData
                                                .data!
                                                .users!
                                                .images!
                                                .length
                                                .toDouble(),
                                            divisions: valueofViewModel
                                                        .otherusermoreinfoData
                                                        .data!
                                                        .users!
                                                        .images!
                                                        .length >
                                                    1
                                                ? valueofViewModel
                                                        .otherusermoreinfoData
                                                        .data!
                                                        .users!
                                                        .images!
                                                        .length -
                                                    1
                                                : valueofViewModel
                                                    .otherusermoreinfoData
                                                    .data!
                                                    .users!
                                                    .images!
                                                    .length,
                                            activeColor: AppColor().tealcolor,
                                            inactiveColor:
                                                AppColor().greylightcolor,
                                            label: '',
                                            onChanged: (double val) {
                                              setState(() {
                                                maxDistance = val;
                                                debugPrint(maxDistance
                                                    .toString()
                                                    .substring(0, 1));
                                                _scrollController.scrollTo(
                                                    index: (int.parse(
                                                            maxDistance
                                                                .toString()
                                                                .substring(
                                                                    0, 1)) -
                                                        1),
                                                    duration: const Duration(
                                                      milliseconds: 300,
                                                    ));
                                                // scrollToItem();
                                              });
                                            },
                                          ),
                                        ),
                              // Stack(
                              //   children: [
                              //     Container(
                              //       height: 36,
                              //       color: Colors.transparent,
                              //       child: Container(
                              //         width: screenwidth,
                              //         height: 5.0,
                              //         margin: const EdgeInsets.fromLTRB(
                              //             46, 15.5, 46, 15.5),
                              //         decoration: BoxDecoration(
                              //           borderRadius: const BorderRadius.all(
                              //               Radius.circular(100)),
                              //           color: AppColor().greylightcolor,
                              //         ),
                              //       ),
                              //     ),
                              //     GestureDetector(
                              //       onTap: () {
                              //         scrollToItem();
                              //       },
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(left: 103),
                              //         child: Container(
                              //           padding: const EdgeInsets.all(3),
                              //           height: 36,
                              //           width: 36,
                              //           decoration: BoxDecoration(
                              //             borderRadius: const BorderRadius.all(
                              //                 Radius.circular(100)),
                              //             color: AppColor().whitecolor,
                              //           ),
                              //           child: Transform.rotate(
                              //             angle: pi / 2,
                              //             child: Icon(
                              //               Icons.menu,
                              //               color:
                              //                   AppColor().walkthroughtwoIconcolor,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 22,
                                  top: 44,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            //'Sophia, 23',
                                            valueofViewModel
                                                .otherusermoreinfoData
                                                .data!
                                                .users!
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w700,
                                              color: AppColor().textcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            //'Harvard University',
                                            'Age: ${valueofViewModel.otherusermoreinfoData.data!.users!.age.toString()}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor().textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    users.filter!.isShowRank == 0
                                        ? Container()
                                        : SizedBox(
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Container(
                                                    transform: Matrix4
                                                        .translationValues(
                                                            0, 10, 0),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 24,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10)),
                                                      color:
                                                          // users.rankNumber! < 5
                                                          //     ? Colors.black
                                                          //     : users.rankNumber! > 4 &&
                                                          //             users.rankNumber! < 7
                                                          //         ? AppColor().bronzeColor
                                                          // users.rank == bronzeVal
                                                          //     ? AppColor().bronzeColor
                                                          users.rank == blackVal
                                                              ? AppColor()
                                                                  .blackColor
                                                              : users.rank ==
                                                                      bronzeVal
                                                                  ? AppColor()
                                                                      .bronzeColor
                                                                  : users.rank ==
                                                                          goldVal
                                                                      ? AppColor()
                                                                          .goldColor
                                                                      : users.rank ==
                                                                              rosegoldVal
                                                                          ? AppColor()
                                                                              .rosegoldColor
                                                                          : users.rank == platinumVal
                                                                              ? AppColor().platinumColor
                                                                              : users.rank == platinumdimeVal
                                                                                  ? AppColor().platinumDimColor
                                                                                  : AppColor().bronzeColor,
                                                      // AppColor()
                                                      //     .containercolor
                                                      //     .withOpacity(0.9),
                                                    ),
                                                    child: Text(
                                                      valueofViewModel
                                                          .otherusermoreinfoData
                                                          .data!
                                                          .users!
                                                          .rankNumber
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColor()
                                                            .textwhitecolor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    transform: Matrix4
                                                        .translationValues(
                                                            0, -48, 0),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 11,
                                                        vertical: 3),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  6)),
                                                      color:
                                                          AppColor().tealcolor,
                                                    ),
                                                    child: Text(
                                                      'Rank',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColor()
                                                            .textwhitecolor,
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
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 50,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'About me',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor().tealcolor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          //'I’m just me ',
                                          valueofViewModel.otherusermoreinfoData
                                              .data!.users!.about
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor().textcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: AppColor().tealcolor,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      'Distance',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor().tealcolor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      // '109.64 mi',
                                      '${valueofViewModel.otherusermoreinfoData.data!.users!.distance} mi',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor().textcolor,
                                      ),
                                    ),
                                    widget.chatButton == true
                                        ? const SizedBox(
                                            height: 20,
                                          )
                                        : Container(),
                                    widget.chatButton == false
                                        ? Container()
                                        : Consumer<OtherUserFollowViewModel>(
                                            builder: (context, likevm, child) {
                                            return PrimaryButtonLoading(
                                              buttonText:
                                                  // value.loginloading == false
                                                  //     ?
                                                  Text(
                                                'Start Chat',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColor().textwhitecolor,
                                                ),
                                              ),
                                              // : customcircularprogress(
                                              //     passcolor: AppColor().whitecolor,
                                              //   ),
                                              passOnTap: () async {
                                                if (likevm.likeloading ==
                                                    true) {
                                                  debugPrint('wait');
                                                } else {
                                                  // debugPrint(users.isLikedByMe.toString());
                                                  // debugPrint('other ${users.filter!.profilePreference}');
                                                  // debugPrint('self ${userSelfData.userdata.gender}');

                                                  FormData data =
                                                      FormData.fromMap({
                                                    'like_to': users.id,
                                                  });
                                                  likevm.otherUserLikeApi(
                                                    context: context,
                                                    data: data,
                                                    herlikedToUserID:
                                                        widget.userId,
                                                    herelikedToUserName:
                                                        widget.userName,
                                                    herelikedToUserProfile:
                                                        widget.userProfile,
                                                    herelikedByUserName:
                                                        userSelfData
                                                            .userdata.name
                                                            .toString()
                                                            .toLowerCase(),
                                                    herelikedByUserProfile:
                                                        userSelfData.userdata
                                                                .profileImage ??
                                                            'null',
                                                  );
                                                }
                                              },
                                            );
                                          }),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    );
                }
              }),
            ),
          ),
          Consumer<BottomNavProvider>(
              builder: (context, valueofBottomNav, child) {
            return Consumer<OtherUserFollowViewModel>(
                builder: (context, valueofVM, child) {
              debugPrint(valueofVM.likedme.toString());
              return valueofVM.likedme == true
                  ? LikeMatchingComponent(
                      firstImg:

                          ///
                          FadeInImage(
                        placeholder: const AssetImage(logo),
                        image: NetworkImage(
                          valueofVM.likedToUserProfile.toString(),
                        ),
                        fit: BoxFit.fill,
                        imageErrorBuilder: (context, object, trace) {
                          return Image.asset(
                            logo,
                            height: 126,
                            width: 126,
                            fit: BoxFit.fill,
                          );
                        },
                        height: 126,
                        width: 126,
                      ),
                      // Image.asset(
                      //   walkthroughoneImgone,
                      //   fit: BoxFit.cover,
                      // ),
                      ///
                      secondImg: FadeInImage(
                        placeholder: const AssetImage(logo),
                        image: NetworkImage(
                          valueofVM.likedByUserProfile.toString(),
                        ),
                        fit: BoxFit.fill,
                        imageErrorBuilder: (context, object, trace) {
                          return Image.asset(
                            logo,
                            height: 126,
                            width: 126,
                            fit: BoxFit.fill,
                          );
                        },
                        height: 126,
                        width: 126,
                      ),
                      mutualLikeText:
                          'you and ${valueofVM.userName} like each other',
                      passonTapKeepScalling: () {
                        valueofVM.setLikedMutal(false);
                      },
                      passSendMessageButton:
                          valueofVM.firBaseFunLoasding == true
                              ? const CircularProgressIndicator()
                              : Text(
                                  'Send Message',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor().textwhitecolor,
                                  ),
                                ),
                      passonTapSendMessage: () async {
                        valueofVM.setFirebaseFunLoading(true);
                        fireBaseFunctions.createUser(
                          context: context,
                          docID: valueofVM.likedToUserID,
                          userID: valueofVM.likedByUserID,
                          userName: valueofVM.userName,
                          userProfile: valueofVM.likedByUserProfile,
                        );
                        await Future.delayed(const Duration(seconds: 2));
                        fireBaseFunctions.createUser(
                          context: context,
                          docID: valueofVM.likedByUserID!,
                          userID: valueofVM.likedToUserID,
                          userName: valueofVM.likedToUserName,
                          userProfile: valueofVM.likedToUserProfile,
                        );
                        // .then((value) async {
                        // await Future.delayed(const Duration(seconds: 2));
                        // fireBaseFunctions.createUser(
                        //   context: context,
                        //   docID: valueofVM.likedToUserID,
                        //   userID: valueofVM.likedByUserID,
                        //   userName: valueofVM.userName,
                        // );
                        // });
                        valueofVM.setLikedMutal(false);
                        valueofVM.setFirebaseFunLoading(false);

                        valueofBottomNav.setindex(2);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesName.bottomnav,
                          (route) => false,
                        );
                      },
                    )
                  : Container();
            });
          }),
        ],
      ),
    );
  }

  Widget images(BuildContext context, double screenwidth, String imageUrl) {
    return Container(
      alignment: Alignment.center,
      // margin: const EdgeInsets.only(top: 30, bottom: 36),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: FadeInImage(
          placeholder: const AssetImage(logo),
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
          imageErrorBuilder: (context, object, trace) {
            return Image.asset(
              logo,
              height: 320,
              width: screenwidth - 62,
              fit: BoxFit.fill,
            );
          },
          height: 320,
          width: screenwidth - 62,
        ),
        // imageUrl != ''
        //     ? Image.network(
        //         width: screenwidth - 40,
        //         height: 300,
        //         imageUrl,
        //         fit: BoxFit.fill,
        //       )
        //     : Image.asset(
        //         walkthroughoneImgone,
        //         width: screenwidth - 40,
        //         height: 300,
        //         fit: BoxFit.fill,
        //       ),
      ),
    );
  }
}
