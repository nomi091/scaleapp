import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want to exit?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print('yes selected');
                          }
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor().tealcolor,
                        ),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print('no selected');
                        }
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade800,
                      ),
                      child: const Text("No",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
