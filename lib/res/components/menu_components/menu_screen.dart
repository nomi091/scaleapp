import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class MenuScreenComponent extends StatelessWidget {
  final String iconOnedata;
  final Color? passContainerColor;
  final Color? passIconColor;
  final String textContent;
  const MenuScreenComponent({
    Key? key,
    this.passContainerColor,
    this.passIconColor,
    required this.iconOnedata,
    required this.textContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 32, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  iconOnedata,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 12,
                color: Colors.transparent,
                height: 25,
              ),
              Text(
                // 'Notification',
                textContent,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor().textcolor,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              height: 25,
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: AppColor().greylightcolor,
            size: 18,
          ),
        ],
      ),
    );
  }
}
