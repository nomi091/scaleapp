// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class WalkthroughDotsandSelected extends StatelessWidget {
  final int? passselectedIndex;
  const WalkthroughDotsandSelected({Key? key, required this.passselectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 8,
      width: screenwidth,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return index == passselectedIndex
              ? Container(
                  height: 8,
                  width: 43,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    color: AppColor().tealcolor,
                  ),
                )
              : Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: AppColor().greylightsecondcolor,
                  ),
                );
        },
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  void Function()? passOnTap;
  final Color? buttonTextColor;
  final Color? buttonColor;
  PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.passOnTap,
    this.buttonTextColor,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: passOnTap,
      child: Container(
        width: screenwidth,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: AppColor().tealcolor,
          //   width: 1.0,
          // ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: buttonColor ?? AppColor().tealcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: buttonTextColor ?? AppColor().textwhitecolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
class PrimaryButtonLoading extends StatelessWidget {
  final Widget buttonText;
  void Function()? passOnTap;
  final Color? buttonColor;
  PrimaryButtonLoading({
    Key? key,
    required this.buttonText,
    required this.passOnTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: passOnTap,
      child: Container(
        width: screenwidth,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: AppColor().tealcolor,
          //   width: 1.0,
          // ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: buttonColor ?? AppColor().tealcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: buttonText,
          ),
        ),
      ),
    );
  }
}

////////////////secondary button////////////////////////
class SecondaryButton extends StatelessWidget {
  void Function()? passOnTap;
  final Widget? textwidget;
  final Color? buttonColor;
  final double? width;
  SecondaryButton({
    Key? key,
    required this.passOnTap,
    this.textwidget,
    this.buttonColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: passOnTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: buttonColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Center(
            child: textwidget,
          ),
        ),
      ),
    );
  }
}

class BottomLine extends StatelessWidget {
  const BottomLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: 2,
      width: screenwidth,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: AppColor().greylightcolor,
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Stack(
            children: [
              Container(
                width: 65.0,
                height: 29.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  color: _circleAnimation!.value == Alignment.centerLeft
                      ? AppColor().switchOffcolor
                      : AppColor().tealcolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                  child: Container(
                    alignment: widget.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: _circleAnimation!.value == Alignment.centerLeft
                          ? const EdgeInsets.only(left: 1)
                          : const EdgeInsets.only(right: 1),
                      width: 23.0,
                      height: 23.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: _circleAnimation!.value != Alignment.centerLeft
                    ? const EdgeInsets.only(left: 15, top: 5)
                    : const EdgeInsets.only(left: 28, top: 5),
                child: Text(
                  _circleAnimation!.value == Alignment.centerLeft
                      ? 'Off'
                      : 'On',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor().textwhitecolor,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

//////////////////////////////circular indicator///////////////////////
Widget customcircularprogress({Color? passcolor, double? passSize}) {
  return SizedBox(
    height: passSize,
    width: passSize,
    child: Center(
      child: CircularProgressIndicator(
        color: passcolor ?? AppColor().tealcolor,
      ),
    ),
  );
}

/////////////////////////////No Data Found//////////////////////////////
Widget noDataFound() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Text(
        'No Data Found',
        style: TextStyle(
          color: AppColor().blackcolor,
        ),
      ),
    ),
  );
}

////////////////////////////////////////////////////////
class PopUpButtonLoading extends StatelessWidget {
  final Widget buttonText;
  void Function()? passOnTap;
  final Color? buttonColor;
  PopUpButtonLoading({
    Key? key,
    required this.buttonText,
    required this.passOnTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: passOnTap,
      child: Container(
        width: screenwidth,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor().whitecolor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: buttonColor ?? AppColor().tealcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: buttonText,
          ),
        ),
      ),
    );
  }
}
