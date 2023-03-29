import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/image_provider.dart';
import 'package:scaleapp/res/widgets/dashboard_widgets/back_pop_widget.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view/chat_screens/messages_screen.dart';
import 'package:scaleapp/view/home/home_screen_1.dart';
import 'package:scaleapp/view/menu_screens/menu_view.dart';
import 'package:scaleapp/view/profile_screens/edit_profile_screen.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String? userFromId;
  int? spId;
  bool loading = true;
  bool inElse = false;
  dynamic userMap = <String, dynamic>{};
  @override
  void initState() {
    Future<UserModel> getUserData() => UserViewModel().getUser();
    getUserData().then((value) {
      spId = value.id;
    }).then((value) {
      if (spId == null) {
        getUserData().then((value) {
          spId = value.id;
          // setState(() {
          loading = false;
          // });
        });
      } else {
        // setState(() {
        loading = false;
        // });
      }
    });
    super.initState();
  }

  // bool initialload = true;
  final screens = [
    const HomeScreenOne(),
    const ProfileEditingScreen(),
    const MessagesView(),
    const MenuView(),
  ];
  int? isVerified;
  int? isSeller;
  bool tokengot = false;

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    final imageViewModel = Provider.of<Imageprovider>(context, listen: false);
    // final scrollprovider = Provider.of<Scrollprovider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        if (bottomNavProvider.currentIndex != 0) {
          bottomNavProvider.setindex(0);
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.bottomnav,
            (route) => false,
          );
        } else {
          showExitPopup(context);
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        drawerEnableOpenDragGesture: false,
        body: Center(
          child: screens[bottomNavProvider.currentIndex],
        ),
        bottomNavigationBar:
            // loading == true
            //     ? Container()
            //     :
            BottomAppBar(
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // bottomnavcontent(
                    //   context: BuildContext,
                    //   passontap: () {
                    //     bottomNavProvider.setindex(0);
                    //   },
                    //   passicondata: bottomNavProvider.currentIndex == 0
                    //       ? Icons.favorite
                    //       : Icons.favorite_border,
                    //   passiconcolor: bottomNavProvider.currentIndex == 0
                    //       ? AppColor().tealcolor
                    //       : AppColor().texthintcolor,
                    // ),
                    Container(
                      height: 30,
                      width: 40,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          bottomNavProvider.setindex(0);
                          imageViewModel.removenetworkImage(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SvgPicture.asset(
                            heartfillImg,
                            fit: BoxFit.cover,
                            color: bottomNavProvider.currentIndex == 0
                                ? AppColor().tealcolor
                                : AppColor().texthintcolor,
                          ),
                        ),
                      ),
                    ),
                    // bottomnavcontent(
                    //   context: BuildContext,
                    //   passontap: () {
                    //     bottomNavProvider.setindex(1);
                    //   },
                    //   passicondata: bottomNavProvider.currentIndex == 0
                    //       ? Icons.person
                    //       : Icons.person_rounded,
                    //   passiconcolor: bottomNavProvider.currentIndex == 1
                    //       ? AppColor().tealcolor
                    //       : AppColor().texthintcolor,
                    // ),
                    Container(
                      height: 30,
                      width: 40,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // scrollprovider.setID(passid: -1);
                          bottomNavProvider.setindex(1);
                          imageViewModel.removenetworkImage(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SvgPicture.asset(
                            profileImg,
                            fit: BoxFit.cover,
                            color: bottomNavProvider.currentIndex == 1
                                ? AppColor().tealcolor
                                : AppColor().texthintcolor,
                          ),
                        ),
                      ),
                    ),
                    // bottomnavcontent(
                    //   context: BuildContext,
                    //   passontap: () {
                    //     bottomNavProvider.setindex(2);
                    //   },
                    //   passicondata: FontAwesomeIcons.comment,
                    //   passiconcolor: bottomNavProvider.currentIndex == 2
                    //       ? AppColor().tealcolor
                    //       : AppColor().texthintcolor,
                    // ),
                    Container(
                      height: 30,
                      width: 40,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('allusers')
                                  .doc(spId.toString())
                                  .collection('user')
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> usersnapshot) {
                                if (usersnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else {
                                  bottomNavProvider.setCount(0);
                                  return SizedBox(
                                    width: 8,
                                    height: 8,
                                    child: ListView.builder(
                                        itemCount:
                                            usersnapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot document =
                                              usersnapshot.data!.docs[index];
                                          userMap = document.data();
                                          userMap["status"] == 'unread';
                                          if (userMap["status"] == 'unread') {
                                            bottomNavProvider.setCount(
                                                bottomNavProvider.count + 1);
                                          }

                                          // if (index ==
                                          //     usersnapshot
                                          //         .data!.docs.length) {
                                          // debugPrint('count is');
                                          // debugPrint(
                                          //     bottomNavProvider.count.toString());
                                          // debugPrint(index.toString());
                                          // debugPrint('count is');
                                          inElse = true;
                                          return Container(
                                            // alignment: Alignment.topRight,
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              color: bottomNavProvider.count > 0
                                                  ? AppColor()
                                                      .unreadmessagecolor
                                                  : Colors.transparent,
                                            ),
                                          );
                                          // } else {
                                          //   return Container();
                                          // }
                                        }),
                                  );
                                }
                              }),
                          Container(
                            height: 30,
                            width: 40,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // scrollprovider.setID(passid: -1);
                                bottomNavProvider.setindex(2);
                                imageViewModel.removenetworkImage(true);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: SvgPicture.asset(
                                  chatImg,
                                  fit: BoxFit.cover,
                                  color: bottomNavProvider.currentIndex == 2
                                      ? AppColor().tealcolor
                                      : AppColor().texthintcolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // bottomnavcontent(
                    //   context: BuildContext,
                    //   passontap: () {
                    //     bottomNavProvider.setindex(3);
                    //   },
                    //   passicondata: Icons.menu_book_outlined,
                    //   passiconcolor: bottomNavProvider.currentIndex == 3
                    //       ? AppColor().tealcolor
                    //       : AppColor().texthintcolor,
                    // ),
                    InkWell(
                      onTap: () {
                        // scrollprovider.setID(passid: -1);
                        bottomNavProvider.setindex(3);
                        imageViewModel.removenetworkImage(true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SvgPicture.asset(
                          bottomnavMenuIcon,
                          fit: BoxFit.cover,
                          color: bottomNavProvider.currentIndex == 3
                              ? AppColor().tealcolor
                              : AppColor().texthintcolor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
