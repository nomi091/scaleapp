import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/data/responce/status.dart';
import 'package:scaleapp/res/components/home_other_profile_component/like_matching_component.dart';
import 'package:scaleapp/res/components/home_other_profile_component/other_profile_info_component.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/home_provider/slider_provider.dart';
import 'package:scaleapp/res/provider/home_provider/user_api_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/view_model/auth_view_model/user_info_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/other_user_like_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/user_list_view_model.dart';
import 'package:scaleapp/view_model/services/firebase_methods.dart';
import 'package:scaleapp/view_model/services/firebase_notification_services.dart';

class HomeScreenOne extends StatefulWidget {
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  UsersListViewModel usersListViewModel = UsersListViewModel();
  FireBaseFunctions fireBaseFunctions = FireBaseFunctions();
  String? userFromId;
  @override
  void initState() {
    // final userAPIprovider =
    //     Provider.of<UserAPIprovider>(context, listen: false);
    FirebaseMessageService.startMessageListener(context);
    // if (userAPIprovider.hitApi == true) {
      userInformationViewModel.userInfoApi(context).then((value) {
        usersListViewModel.otherusersListApi(context).then((value) {
          // fireBaseFunctions.createUser(context).then((value) {
          //   fireBaseFunctions.loginUser(context);
          // });
        });
      });
    // } else {
    //   usersListViewModel.otherusersListApi(context).then((value) {
    //     // fireBaseFunctions.createUser(context).then((value) {
    //     //   fireBaseFunctions.loginUser(context);
    //     // });
    //   });
    // }

    ///
    // var collection = FirebaseFirestore.instance.collection('allusers');
    // Future<UserModel> getUserData() => UserViewModel().getUser();
    // getUserData().then((value) {
    //   userFromId = value.id.toString();
    // });
    // debugPrint('check new message');
    // collection.doc(userFromId.toString()).collection('user').snapshots();
    // debugPrint('');

    ///

    super.initState();
  }

  UserInformationViewModel userInformationViewModel =
      UserInformationViewModel();
  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    // final usersListViewModel =
    //     Provider.of<UsersListViewModel>(context, listen: true);
    // final screenwidth = MediaQuery.of(context).size.width;
    final userSelfData =
        Provider.of<UserProfileProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ChangeNotifierProvider<UsersListViewModel>(
              create: (BuildContext context) => usersListViewModel,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Image.asset(
                        logo,
                        width: 150,
                        height: 128,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer<UsersListViewModel>(builder: (context, value, _) {
                      switch (value.otherusersprofileData.status) {
                        case Status.LOADING:
                          return Column(
                            children: const [
                              SizedBox(
                                height: 100,
                              ),
                              Text('Processing...'),
                            ],
                          );
                        case Status.ERROR:
                          debugPrint('Status Error');
                          return Text(
                              value.otherusersprofileData.message.toString());
                        default:
                          return value
                                  .otherusersprofileData.data!.users!.isEmpty
                              ? Center(child: noDataFound())
                              : ListView.separated(
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: value.otherusersprofileData.data!
                                      .users!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // debugPrint(value.otherusersprofileData.data!
                                    //     .users![index].profileImage);
                                    // debugPrint(index.toString());

                                    ///
                                    if (index == 0) {
                                      sliderProvider.clearRankList();
                                      sliderProvider.setInitialRankList(value
                                          .otherusersprofileData
                                          .data!
                                          .users!
                                          .length);
                                    }

                                    ///
                                    return OtherProfileInfoList(
                                      users: value.otherusersprofileData.data!
                                          .users![index],
                                      passindex: index,
                                    );
                                  },
                                  separatorBuilder: (BuildContext context,
                                          int index) =>

                                      /// If Pocket is On and Other User show rank OFF ///
                                      userSelfData.userdata.matchPreference!
                                                      .isPocket ==
                                                  1 &&
                                              value
                                                      .otherusersprofileData
                                                      .data!
                                                      .users![index]
                                                      .filter!
                                                      .isShowRank ==
                                                  0
                                          ? Container()

                                          /// Else ///
                                          : Column(
                                              children: const [
                                                BottomLine(),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                              ],
                                            ),
                                );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
          Consumer<BottomNavProvider>(
              builder: (context, valueofBottomNav, child) {
            return Consumer<OtherUserFollowViewModel>(
                builder: (context, valueofVM, child) {
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
                      },
                    )
                  : Container();
            });
          })
        ],
      ),
    );
  }
}
