import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/colors.dart';

Future<bool> getLocationPopup({
  BuildContext? context,
  void Function()? passonTabAllow,
  void Function()? passonTabDeny,
}) async {
  return await showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Scale App collects location data to enable users to see the distance in miles between other users. Users also have the option use a distance filter for their search preferences.",
                  style: TextStyle(
                    color: AppColor().textcolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: passonTabDeny,
                        child: Text(
                          'Deny',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor().tealcolor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: passonTabAllow,
                        child: Text(
                          'Allow',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor().tealcolor,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
