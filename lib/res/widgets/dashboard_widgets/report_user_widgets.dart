import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

// ignore: must_be_immutable
class CheckBoxAndReportContent extends StatelessWidget {
  bool passCheckBoxValue;
  void Function(bool?)? passonChangedCheckBox;
  String passCheckBoxText;
   CheckBoxAndReportContent({
    Key? key,
    required this.passCheckBoxValue,
    required this.passonChangedCheckBox,
    required this.passCheckBoxText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenwidth - 40,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Checkbox(
            value: passCheckBoxValue,
            onChanged: passonChangedCheckBox,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(passCheckBoxText,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor().textcolor,
                )),
          )
        ],
      ),
    );
  }
}
