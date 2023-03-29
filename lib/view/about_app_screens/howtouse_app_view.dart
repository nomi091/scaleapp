import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaleapp/res/widgets/walkthrough_widgets.dart/walkthroughfive_widget.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:url_launcher/url_launcher.dart';

class HowToUseAppView extends StatelessWidget {
  const HowToUseAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Features/How to use',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColor().textcolor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'View and assess other users profile',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor().textcolor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.camera,
                      color: AppColor().tealcolor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        'Click the tab to view the users’ bio and additional pictures if they have them. Locate Scale picture slider and slide it from left to right to view all of the users’ pictures.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 20,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: (screenwidth - 110),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            walkthroughoneImgone,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      height: 30,
                      color: Colors.transparent,
                      child: Container(
                        width: screenwidth,
                        height: 7.0,
                        margin: const EdgeInsets.fromLTRB(66, 11.5, 66, 11.5),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().greylightcolor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 73),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().whitecolor,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            color: AppColor().tealcolor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Rita , 32',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor().textcolor,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 13),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: AppColor().redcolor,
                        ),
                        child: Text(
                          '1 -10',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: AppColor().textwhitecolor,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        transform: Matrix4.translationValues(0, -8, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          color: AppColor().tealcolor,
                        ),
                        child: Text(
                          'Rank Me',
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
                  height: 33,
                ),
                Stack(
                  children: [
                    Container(
                      height: 36,
                      color: Colors.transparent,
                      child: Container(
                        width: screenwidth,
                        height: 5.0,
                        margin: const EdgeInsets.fromLTRB(66, 15.5, 66, 15.5),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().greylightcolor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 73),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().whitecolor,
                        ),
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Icon(
                            Icons.menu,
                            color: AppColor().walkthroughtwoIconcolor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Ranking feature- Rank the person's physical attraction "
                    "by moving the slider left to right to the appropriate number.\n\n"
                    '1 is the lowest and 10 is the highest. 1-3 is the '
                    'lower range of attractiveness, 4-6 is average to good '
                    'looking and 7-10 is very attractive to gorgeous. It may '
                    'be best to use this scale as a guide during your '
                    'ranking. Toggling your rank on, broadcast the rank of '
                    'your profile for others to see. Toggling it off, only allows '
                    "you to see what your rank is but no one else can see it.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor().textcolor,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                    //     color: AppColor().tealcolor,
                    //     border: Border.all(
                    //       color: AppColor().greylightcolor,
                    //       width: 5,
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(13),
                    //     child: Icon(
                    //       Icons.thumb_up,
                    //       color: AppColor().walkthroughthreethumbUPIconcolor,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 67,
                      width: 67,
                      child: Image.asset(
                        walkthroughthreeImgLike,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: AppColor().greylightcolor,
                          border: Border.all(
                            color:
                                AppColor().walkthroughthreeContainerBordercolor,
                            width: 1.0,
                          )),
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 67,
                      width: 67,
                      child: Image.asset(
                        walkthroughthreeImgUnlike,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                    //     color: AppColor().tealcolor,
                    //     border: Border.all(
                    //       color: AppColor().greylightcolor,
                    //       width: 5,
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(13),
                    //     child: Icon(
                    //       Icons.thumb_down,
                    //       color: AppColor().walkthroughthreethumbDownIconcolor,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    Container(
                      height: 36,
                      color: Colors.transparent,
                      child: Container(
                        width: screenwidth,
                        height: 5.0,
                        margin: const EdgeInsets.fromLTRB(66, 15.5, 66, 15.5),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().greylightcolor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 73),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: AppColor().whitecolor,
                        ),
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Icon(
                            Icons.menu,
                            color: AppColor().walkthroughtwoIconcolor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Text.rich(
                    
                    textAlign: TextAlign.start,
                    TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor().textcolor,
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Next, you either ',
                        ),
                        // TextSpan(
                        //   text: 'swipe left',
                        //   style: TextStyle(
                        //     color: AppColor().redcolor,
                        //     fontWeight: FontWeight.w700,
                        //   ),
                        // ),
                        const TextSpan(text: 'press the '),
                        TextSpan(
                          text: 'red thumbs down button',
                          style: TextStyle(
                            color: AppColor().redcolor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(
                          text: ' for not interested or press the ',
                        ),
                        TextSpan(
                          text: 'green thumbs up button',
                          style: TextStyle(
                            color: AppColor().tealcolor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(
                          text: ' to show interest.\n',
                        ),
                        const TextSpan(
                          text:
                              "Showing intrest means that if the same user also likes your profile then you will be able to message each other. Do not give a thumbs up (Like) if you don't desire communicating with this user",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        'Pocket Feature',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor().textcolor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Pocket feature- Toggle ‘Pocket’ on to view profiles that "
                    "have been ranked the same, one point less and one "
                    'point higher than your profile. If you are ranked a 10, '
                    'then turning your pocket on shows you profiles ranked '
                    '8,9 and 10. These profiles have been ranked, by other '
                    'users, to have the same or similar attraction levels as '
                    'your own, which may increase compatibility. Toggling '
                    '‘Pocket’ off allows you to see all the profiles available, '
                    "regardless of their rank.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor().textcolor,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More can be learned about dating pockets by reading Optimal Happiness- Love Ain’t Never Been Enough -',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor().textcolor,
                          height: 1.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('url click');
                          _launchURL();

                          //'https://www.amazon.com/Optimal-Happiness-Love-Never-Enough-ebook/dp/B07PLD5T58/ref=sr_1_1?crid=19YP92W3WC6US&keywords=optimal+happiness-+love+ain%27t+never+been+enough&qid=1664899042&qu=eyJxc2MiOiIxLjAxIiwicXNhIjoiMC4wMCIsInFzcCI6IjAuMDAifQ%3D%3D&s=books&sprefix=optimal+happiness-+love+aint+never+been+enough%2Cstripbooks%2C74&sr=1-1Amazon.com');
                        },
                        child: Text(
                          '(Click Here)',
                          style: TextStyle(
                            color: AppColor().tealcolor,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 12,
                //   ),
                //   child: Text.rich(
                //     textAlign: TextAlign.start,
                //     TextSpan(
                //       // Note: Styles for TextSpans must be explicitly defined.
                //       // Child text spans will inherit styles from parent
                //       style: TextStyle(
                //         fontSize: 12,
                //         fontWeight: FontWeight.w400,
                //         color: AppColor().textcolor,
                //         height: 1.5,
                //       ),
                //       children: [
                //         const TextSpan(
                //           text:
                //               'More can be learned about dating pockets by reading Optimal Happiness- Love Ain’t Never Been Enough -',
                //         ),
                //         TextSpan(
                //           text: '\n(Click Here)',
                //           style: TextStyle(
                //             color: AppColor().tealcolor,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Scale Medallions are awarded to profiles that are ranked 5 and above.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor().textcolor,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SacalesLevels(
                      headerText: 'Scale Level 9.5 +',
                      imagepath: scale10,
                      bottomText: 'Platinum Dime',
                    ),
                    SacalesLevels(
                      headerText: 'Scale Level 9',
                      imagepath: scale9,
                      bottomText: 'Platinum',
                    ),
                    SacalesLevels(
                      headerText: 'Scale Level 8',
                      imagepath: scale8,
                      bottomText: 'Rose Gold',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    SacalesLevels(
                      headerText: 'Scale Level 7',
                      imagepath: scale7,
                      bottomText: 'Gold',
                    ),
                    SacalesLevels(
                      headerText: 'Scale Level 6&5',
                      imagepath: scale6,
                      bottomText: 'Bronze',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: deprecated_member_use
  void _launchURL() async => await launch(
      'https://www.amazon.com/Optimal-Happiness-Love-Never-Enough-ebook/dp/B07PLD5T58/ref=sr_1_1?crid=19YP92W3WC6US&keywords=optimal+happiness-+love+ain%27t+never+been+enough&qid=1664899042&qu=eyJxc2MiOiIxLjAxIiwicXNhIjoiMC4wMCIsInFzcCI6IjAuMDAifQ%3D%3D&s=books&sprefix=optimal+happiness-+love+aint+never+been+enough%2Cstripbooks%2C74&sr=1-1Amazon.com');
}
