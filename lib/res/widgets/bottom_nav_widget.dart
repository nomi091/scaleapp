import 'package:flutter/material.dart';

Widget bottomnavcontent({
  context,
  passontap,
  passicondata,
  passiconcolor,
}) {
  return InkWell(
    onTap: passontap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Icon(
        passicondata,
        color: passiconcolor,
      ),
    ),
  );
}
