import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class MatchingChatSescriptionComponent extends StatelessWidget {
  final bool dotYesOrNo;
  final String passImg;
  final Color passmessageStatusColor;
  final String passuserName;
  final String passdescription;
  const MatchingChatSescriptionComponent({
    Key? key,
    required this.dotYesOrNo,
    required this.passImg,
    required this.passmessageStatusColor,
    required this.passuserName,
    required this.passdescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: AppColor().tealcolor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: Image.asset(
                        passImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                dotYesOrNo == false
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 36),
                        child: Container(
                          alignment: Alignment.topRight,
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            color: passmessageStatusColor,
                            border: Border.all(
                              color: AppColor().whitecolor,
                              width: 2,
                            ),
                          ),
                        ),
                      )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              passuserName,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor().textcolor,
                height: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          passdescription,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColor().textcolor,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
