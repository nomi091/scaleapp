import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';

class WaitingCard extends StatelessWidget {
  final double passheightofImage;
  final double passwidthofImage;
  const WaitingCard({
    Key? key,
    required this.passheightofImage,
    required this.passwidthofImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Image.asset(
            logo,
            width: passwidthofImage,
            height: passheightofImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text('Processing...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor().textcolor,
                ))),
      ],
    );
  }
}
