import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class SacalesLevels extends StatelessWidget {
  final String headerText;
  final String bottomText;
  final String imagepath;
  const SacalesLevels({
    Key? key,
    required this.headerText,
    required this.bottomText,
    required this.imagepath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          headerText,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColor().textcolor,
            height: 1.5,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 2,
          shadowColor: AppColor().greylightcolor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: (screenwidth * 0.33) - 21,
              height: 110,
              color: AppColor().whitecolor,
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 90,
                width: (screenwidth * 0.33) - 41,
                child: Image.asset(
                  imagepath,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          bottomText,
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
