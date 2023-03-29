import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/view/chat_screens/chat_screen.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/liked_users/liked_users_list_view_model.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView>
    with WidgetsBindingObserver {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  LikedUsersListViewModel likedUsersListViewModel = LikedUsersListViewModel();

  // Map<String, dynamic>? userMap;
  dynamic userMap = <String, dynamic>{};
  int? spId;
  String? spName;
  String extension = '.png';
  bool loading = true;
  // bool loading = true;
  // Map<String, dynamic>? userMap;
  @override
  void initState() {
    Future<UserModel> getUserData() => UserViewModel().getUser();
    // getFirebaseUsers();
    // likedUsersListViewModel.likedUserListApi(context);
    getUserData().then((value) {
      spId = value.id;
      spName = value.userName;
    }).then((value) {
      if (spId == null) {
        getUserData().then((value) {
          spId = value.id;
          spName = value.userName;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
      WidgetsBinding.instance.addObserver(this);
      setStatus("Online");
    });
    super.initState();
  }

  void setStatus(String status) async {
    await firestore.collection('users').doc(spId.toString()).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: loading == true
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.fromLTRB(20, 23, 20, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Messages',
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
                      height: 35,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('allusers')
                          .doc(spId.toString())
                          .collection('user')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> usersnapshot) {
                        if (usersnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: usersnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot document =
                                    usersnapshot.data!.docs[index];

                                userMap = document.data();

                                return GestureDetector(
                                  onTap: () {
                                    userMap = document.data();
                                    debugPrint(userMap['name'].toString());
                                    debugPrint('userMapname');
                                    debugPrint(spName);
                                    debugPrint('userMapname');
                                    debugPrint('userMapid]');
                                    debugPrint(userMap['id'].toString());
                                    debugPrint(userMap['profile'].toString());
                                    userMap = document.data();
                                    debugPrint(imageBaseUrl +
                                        spId.toString() +
                                        userMap['profile']);
                                    String roomId = chatRoomId(
                                      spId.toString(),
                                      userMap['id'].toString(),
                                    );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => ChatView(
                                          chatRoomId: roomId,
                                          userMap: userMap,
                                          userTo: userMap['name']
                                              .toString()
                                              .toUpperCase(),
                                          userFrom: spName,
                                          userFromId: spId,
                                          userToId: userMap['id'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 5,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: AppColor().whitecolor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                      100,
                                                    )),
                                                    color: AppColor().tealcolor,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                      100,
                                                    )),
                                                    child: FadeInImage(
                                                      placeholder:
                                                          const AssetImage(
                                                              logo),
                                                      image: NetworkImage(
                                                        imageBaseUrl +
                                                            userMap['id']
                                                                .toString() +
                                                            extension,
                                                      ),
                                                      fit: BoxFit.cover,
                                                      imageErrorBuilder:
                                                          (context, object,
                                                              trace) {
                                                        return Image.asset(
                                                          logo,
                                                          height: 48,
                                                          width: 48,
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                      height: 48,
                                                      width: 48,
                                                    ),
                                                  ),
                                                ),
                                                userMap["status"] == 'null'
                                                    ? Container()
                                                    : userMap["status"] ==
                                                            'replied'
                                                        ? Container()
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 36),
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              height: 14,
                                                              width: 14,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            100)),
                                                                color: userMap[
                                                                            "status"] ==
                                                                        'read'
                                                                    ? AppColor()
                                                                        .repliedtomessagecolor
                                                                    : userMap["status"] ==
                                                                            'unread'
                                                                        ? AppColor()
                                                                            .unreadmessagecolor
                                                                        : Colors
                                                                            .transparent,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColor()
                                                                      .whitecolor,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                              ],
                                            ),

                                            ///
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            userMap["name"],
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColor()
                                                                  .textcolor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // Text(
                                                      //     'yo can chat with ${userMap["name"]}'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }

  String chatRoomId(String user1, String user2) {
    if (user1.toLowerCase().compareTo(user2.toLowerCase()) > 0) {
      debugPrint('inIF $user1-$user2');
      return "$user1$user2";
    } else {
      debugPrint('inELSE $user2-$user1');
      return "$user2$user1";
    }
  }
}
