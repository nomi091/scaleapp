import 'package:flutter/material.dart';
import 'package:scaleapp/res/components/aboutapp_matching/matching_chatdescription_component.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';

class MatchingView extends StatelessWidget {
  const MatchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColor().appIconcolor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Matching',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColor().textcolor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "In order for you to match and communicate with another user, you both have to like each other’s profile. Once you have a mutual interest in connecting, then the chat messenger becomes available for you to chat with your matches.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "State of the Art Smart Dot Messenger System",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "The messenger system notifies you when you have new messages and helps you distinguish between read, unread, and messages that you have replied to. \n\n"
                  "Blue dot notifies you of new/unread messages as noted below.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor().textcolor,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MatchingChatSescriptionComponent(
                  dotYesOrNo: true,
                  passImg: blackWomenImg,
                  passmessageStatusColor: AppColor().unreadmessagecolor,
                  passuserName: 'Cindy Williams',
                  passdescription:
                      'Yellow dot notifies you that you have a message that you have not replied to.',
                ),
                const SizedBox(
                  height: 20,
                ),
                MatchingChatSescriptionComponent(
                  dotYesOrNo: true,
                  passImg: matchescreenImg2,
                  passmessageStatusColor: AppColor().repliedtomessagecolor,
                  passuserName: 'Sophia',
                  passdescription:
                      'The absence of a dot notifies you that you have replied to the message.',
                ),
                const SizedBox(
                  height: 20,
                ),
                MatchingChatSescriptionComponent(
                  dotYesOrNo: false,
                  passImg: blackManImg,
                  passmessageStatusColor: AppColor().repliedtomessagecolor,
                  passuserName: 'Inkosi Gyasi',
                  passdescription:
                      'Disclaimer**Please be aware that physical attraction levels are subjective and not the same for each person. Under no circumstances should anyone allow these rankings to heavily influence their self-esteem. Healthy self-esteem is more so derived from personal characteristics rather than solely based on physical attractiveness.**',
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
