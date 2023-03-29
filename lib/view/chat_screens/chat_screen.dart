// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/view_model/liked_users/liked_users_list_view_model.dart';

// ignore: must_be_immutable
class ChatView extends StatefulWidget {
  // final Map<String, dynamic> userMap;
  Map<String, dynamic> userMap = <String, dynamic>{};
  final String chatRoomId;
  var userTo;
  var userFrom;
  var userFromId;
  var userToId;
  ChatView({
    super.key,
    required this.chatRoomId,
    required this.userMap,
    required this.userTo,
    required this.userFrom,
    required this.userFromId,
    required this.userToId,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  LikedUsersListViewModel likedUsersListViewModel = LikedUsersListViewModel();
  bool loading = true;
  String extension = '.png';

  @override
  void initState() {
    readMessageFunct();

    // likedUsersListViewModel.likedUserListApi(context);
    super.initState();
  }

  final TextEditingController _message = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // final Map<String, dynamic> userMap;

    return Scaffold(
      body: SafeArea(
        // appBar: AppBar(title: Center(child: Text(widget.userTo.toString()))),
        child: WillPopScope(
          onWillPop: () async {
            getMessageStatusWhenLeave().then((value) {});

            return true;
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.fromLTRB(
                          5,
                          3,
                          20,
                          3,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor().appIconcolor,
                          size: 28,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        color: AppColor().tealcolor,
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        child: FadeInImage(
                          placeholder: const AssetImage(logo),
                          image: NetworkImage(imageBaseUrl +
                              widget.userToId.toString().toString() +
                              extension),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, object, trace) {
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

                      // SizedBox(
                      //   height: 48,
                      //   width: 48,
                      //   child: Image.asset(
                      //     allnotificationImg,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userTo.toString(),
                          style: TextStyle(
                            color: AppColor().chatUserNamecolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        loading == true
                            ? Container()
                            : StreamBuilder<DocumentSnapshot>(
                                stream: _firestore
                                    .collection("users")
                                    .doc(widget.userToId.toString())
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    return snapshot.data!['status'] == 'null'
                                        ? Container()
                                        : Row(
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(100)),
                                                  color: snapshot.data![
                                                              'status'] ==
                                                          'Online'
                                                      ? AppColor()
                                                          .onlineUsercolor
                                                      : AppColor()
                                                          .oflineUsercolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                snapshot.data!['status'],
                                                style: TextStyle(
                                                  color: AppColor()
                                                      .chatUserNamecolor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          );
                                  } else {
                                    return Container();
                                  }
                                }),
                      ],
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Expanded(
                child: SizedBox(
                  height: size.height / 1.25,
                  width: size.width,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firestore
                        .collection('chatroom')
                        .doc(widget.chatRoomId)
                        .collection('chats')
                        .orderBy("time", descending: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data != null) {
                        // scrollController.jumpTo(
                        //   scrollController.position.maxScrollExtent);
                        // if (scrollController.hasClients) {
                        //   scrollController.animateTo(
                        //     scrollController.position.maxScrollExtent,
                        //     duration: const Duration(milliseconds: 300),
                        //     curve: Curves.easeIn,
                        //   );
                        // }

                        //If you don't need animation, you can just do this without IFs:

                        return ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          itemCount: snapshot.data!.docs.length + 1,
                          itemBuilder: (context, index) {
                            // return Text(snapshot.data!.docs[index]['message']);
                            if (index == snapshot.data!.docs.length) {
                              // scrollController.animateTo(
                              //   scrollController.position.maxScrollExtent,
                              //   duration: const Duration(milliseconds: 300),
                              //   curve: Curves.easeIn,
                              // );
                              return Container(
                                height: 50,
                              );
                            } else {
                              Map<String, dynamic> map =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;
                              return messages(size, map, context);
                            }
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                // height: size.height / 10,
                width: size.width,
                alignment: Alignment.center,
                child: SizedBox(
                  // color: Colors.blue,
                  // height: size.height / 12,
                  width: size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // color: Colors.green,
                        // height: size.height / 17,
                        width: size.width / 1.3,
                        child: TextField(
                          controller: _message,
                          decoration: InputDecoration(
                              // suffixIcon: IconButton(
                              //   onPressed: () => ,
                              //   icon: Icon(Icons.photo),
                              // ),
                              hintText: "Send Message",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          maxLines: 4,
                          minLines: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: onSendMessage,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSendMessage() async {
    var getCountdata;
    // scrollController.animateTo(
    //   scrollController.position.maxScrollExtent,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeOut,
    // );
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": widget.userFromId,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      // Map<String, dynamic> messageStatus = {
      //   "user1": '0',
      //   "user2": '1',
      // };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add(messages);
      // await _firestore
      //     .collection('chatroom')
      //     .doc(chatRoomId)
      //     .set(messageStatus);
      _message.clear();

      /// read unread
      await _firestore
          .collection('allusers')
          .doc(widget.userToId.toString())
          .collection('user')
          .doc(widget.userFromId.toString())
          .update({
        "status": 'unread',
      });
      await _firestore
          .collection('allusers')
          .doc(widget.userFromId.toString())
          .collection('user')
          .doc(widget.userToId.toString())
          .update({
        "status": 'replied',
      });

      ////////////// Extra Added Send Notification ///////////////////
      ///

      // FirebaseMessageService.sendPushMessage(
      //     'Notification Body',
      //     'Notification Title',
      //     'djXxjfLtSLunlyz5Hj8MTp:APA91bGIAiW4RoKLXnRe6u4o9BqWId4lcxt4LuEgREQ98WIgyPWo4iXw0fLVU0pqK6R-i9i8UPGYyEuvF_wrD2TUb4m2WiWuY-H1uZr9N7u2iW8rhhnP8rP1GDEv2qqT6w5LHwt8ykS6');

      // https://www.youtube.com/watch?v=hmJc7Sxq5Nw

      var getCount = _firestore
          .collection('allusers')
          .doc(widget.userToId.toString())
          .collection('chatcount');
      //     .doc(widget.userToId.toString())
      //     .get()
      //     .then((doc) {
      //   getCountdata = doc.data();
      // });
      debugPrint('getCountdata.toString()');

      // var previousvalCount = getCountdata["count"];
      debugPrint(getCount.toString());
      // previousvalCount = int.parse(previousvalCount) + 1;
      // getCount.update({
      //   'count': int.parse(previousvalCount),
      // });

      /// read unread
    } else {
      debugPrint("Enter Some Text");
    }
  }

  //////////////////////////////// Chat Design //////////////////////////
  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return Container(
      width: size.width,
      alignment: map['sendby'] == widget.userFromId
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: map['sendby'] == widget.userFromId
            ? const EdgeInsets.fromLTRB(
                25,
                5,
                8,
                5,
              )
            : const EdgeInsets.fromLTRB(
                8,
                5,
                25,
                5,
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: map['sendby'] == widget.userFromId
              ? AppColor().tealcolor
              : AppColor().whitecolor,
        ),
        child: Text(
          map['message'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: map['sendby'] == widget.userFromId
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> readMessageFunct() async {
    var collection = FirebaseFirestore.instance.collection('allusers');
    var data;
    await collection
        .doc(widget.userFromId.toString())
        .collection('user')
        .doc(widget.userToId.toString())
        .get()
        .then((doc) {
      data = doc.data();
    });
    String status = data["status"];
    if (status == 'read' || status == 'replied') {
      debugPrint('ok');
    } else {
      await _firestore
          .collection('allusers')
          .doc(widget.userFromId.toString())
          .collection('user')
          .doc(widget.userToId.toString())
          .update({
        "status": 'read',
      });
    }
    setState(() {
      loading = false;
    });
  }

  ///
  Future<void> getMessageStatusWhenLeave() async {
    var collection = FirebaseFirestore.instance.collection('allusers');
    var data;
    await collection
        .doc(widget.userFromId.toString())
        .collection('user')
        .doc(widget.userToId.toString())
        .get()
        .then((doc) {
      data = doc.data();
    });
    String status = data["status"];
    debugPrint(status.toString());
    if (status != 'replied' && status != 'read') {
      readMessageFunct().then((value) {
        Navigator.pop(context);
        // Navigator.pushNamedAndRemoveUntil(
        //   context,
        //   RoutesName.bottomnav,
        //   (route) => false,
        // );
      });
    }
  }
}
