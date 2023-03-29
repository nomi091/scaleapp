// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class MyCustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final EdgeInsetsGeometry? passcontentpadding;
  final Color? passenabledBorder;
  final BorderRadius? passborderradious;
  final bool? passreadonly;
  final Color? passhintColor;
  final Color? passfillColor;
  final List<TextInputFormatter>? passinputFormatters;
  void Function()? passonTapTextfield;
  final TextEditingController? passcontroller;
  final int? passmaxLines;
  final String? passinitialValue;
  final TextStyle? passerrorStyle;
  final TextInputAction? passtextInputAction;
  void Function(String)? passonFieldSubmitted;

  MyCustomTextField({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.onChanged,
    this.passcontentpadding,
    this.passenabledBorder,
    this.passborderradious,
    this.passreadonly,
    this.passhintColor,
    this.passfillColor,
    this.passinputFormatters,
    this.passonTapTextfield,
    this.passcontroller,
    this.passmaxLines,
    this.passinitialValue,
    this.passerrorStyle,
    this.passtextInputAction,
    this.passonFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.bottom,
      initialValue: passinitialValue,
      maxLines: passmaxLines ?? 1,
      keyboardType: keyboardType,
      onTap: passonTapTextfield ?? () {},
      inputFormatters: passinputFormatters,
      controller: passcontroller,
      readOnly: passreadonly ?? false,
      textInputAction: passtextInputAction ?? TextInputAction.next,
      onFieldSubmitted: passonFieldSubmitted,
      style: TextStyle(color: AppColor().textcolor),
      decoration: InputDecoration(
        hintText: hintText,
        errorStyle: passerrorStyle,
        hintStyle: TextStyle(
            color: passhintColor ?? AppColor().texthintcolor,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        contentPadding:
            passcontentpadding ?? const EdgeInsets.fromLTRB(25, 14, 25, 14),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: passenabledBorder ?? AppColor().whitecolor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: passenabledBorder ?? AppColor().whitecolor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: passenabledBorder ?? AppColor().whitecolor,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: passenabledBorder ?? AppColor().whitecolor,
            ),
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(5.0))),
        fillColor: passfillColor ?? AppColor().textfeildfillcolor,
        filled: true,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

///////////// profile container textfeild decoration ///////////
InputDecoration containertextfeilddecoration() {
  return InputDecoration(
    // contentPadding: EdgeInsets.only(left: 14,right: 14),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    hintStyle: TextStyle(
        color: AppColor().textcolor, fontWeight: FontWeight.w400, fontSize: 14),
  );
}
