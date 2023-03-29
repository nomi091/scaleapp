// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaleapp/utils/constants/colors.dart';

class ImageComponent extends StatelessWidget {
  void Function()? onTapAddImage;
   ImageComponent({super.key,required this.onTapAddImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 98,
        height: 125,
        color: AppColor().imagecontainercolor,
        alignment: Alignment.bottomCenter,
        child: Column(children: [
          const Spacer(),
          GestureDetector(
            onTap: onTapAddImage,
            child: Container(
              height: 22,
              width: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor().tealcolor,
                borderRadius: BorderRadius.circular(80),
              ),
              child: Icon(
                FontAwesomeIcons.plus,
                color: AppColor().whitecolor,
                size: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          )
        ]),
      ),
    );
  }
}


// Container(
//                                                     height: 120,
//                                                     width: 120,
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       right: 3,
//                                                       top: 3,
//                                                     ),
//                                                     child: GestureDetector(
//                                                       onTap: () {
                                                        
//                                                         value
//                                                             .removeImagesFromList(
//                                                                 index);
//                                                       },
//                                                       child: Align(
//                                                         alignment:
//                                                             Alignment.topRight,
//                                                         child: Icon(
//                                                           FontAwesomeIcons
//                                                               .xmark,
//                                                           color: AppColor()
//                                                               .removeImageIconColor,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),