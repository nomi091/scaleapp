import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';

class LikeMatchingComponent extends StatelessWidget {
  var passonTapSendMessage;
  var passonTapKeepScalling;
  var passSendMessageButton;
  var mutualLikeText;
  final Widget? firstImg;
  final Widget? secondImg;
  LikeMatchingComponent({
    super.key,
    required this.passonTapSendMessage,
    required this.passonTapKeepScalling,
    required this.passSendMessageButton,
    required this.mutualLikeText,
    required this.firstImg,
    required this.secondImg,
  });

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenwidth,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            //I blured the parent container to blur background image, you can get rid of this part
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                //you can change opacity with color here(I used black) for background.
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.55)),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 160,
                ),
                Text(
                  'Its Mutual!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: AppColor().whitecolor,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          //'You and Jullia liked each other',
                          '$mutualLikeText',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColor().whitecolor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 58,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor().whitecolor,
                          border: Border.all(
                            width: 4,
                            color: AppColor().whitecolor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(80),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: 
                          SizedBox(
                            height: 126,
                            width: 126,
                            child: firstImg
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor().whitecolor,
                          border: Border.all(
                            width: 4,
                            color: AppColor().whitecolor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(80),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: SizedBox(
                            height: 126,
                            width: 126,
                            child: secondImg
                            // Image.asset(
                            //   walkthroughoneImgone,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: screenwidth,
                  child: PopUpButtonLoading(
                    buttonColor: Colors.transparent,
                    buttonText: passSendMessageButton,
                    passOnTap: passonTapSendMessage,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: screenwidth,
                  child: PopUpButtonLoading(
                    buttonColor: Colors.transparent,
                    buttonText: Text(
                      'Keep Scaling',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor().textwhitecolor,
                      ),
                    ),
                    passOnTap: passonTapKeepScalling,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
