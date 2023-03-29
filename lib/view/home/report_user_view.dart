import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/provider/home_provider/report_filepick_provider.dart';
import 'package:scaleapp/res/widgets/dashboard_widgets/report_user_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/report_user_view_model.dart';

class ReportUserView extends StatefulWidget {
  final int userId;
  const ReportUserView({Key? key, required this.userId}) : super(key: key);

  @override
  State<ReportUserView> createState() => _ReportUserViewState();
}

class _ReportUserViewState extends State<ReportUserView> {
  ///
  bool checkbox1 = true;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;

  String aboutval = 'i reported';

  ///
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final reportFilePickprovider =
        Provider.of<ReportFilePickprovider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SizedBox(
                    height: screenheight,
                    width: screenwidth,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              logo,
                              width: 150,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      SecondaryButton(
                                        buttonColor: AppColor().tealcolor,
                                        textwidget: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 12,
                                                right: 10,
                                              ),
                                              width: 14,
                                              height: 14,
                                              decoration: BoxDecoration(
                                                color: AppColor().whitecolor,
                                                border: Border.all(
                                                  color: AppColor().whitecolor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                'i',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColor().tealcolor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Text(
                                                'Detail',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColor().textwhitecolor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        passOnTap: () {
                                          // Navigator.pushNamedAndRemoveUntil(
                                          //   context,
                                          //   RoutesName.logIn,
                                          //   (route) => false,
                                          // );
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: SecondaryButton(
                                          buttonColor: AppColor().redcolor,
                                          textwidget: Text(
                                            'Report User',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor().textwhitecolor,
                                            ),
                                          ),
                                          passOnTap: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  ///////////// Upper Content ////////////////
                  SizedBox(
                    width: screenwidth,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(),
                          //I blured the parent container to blur background image, you can get rid of this part
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: Container(
                              //you can change opacity with color here(I used black) for background.
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.55)),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //you can get rid of below line also
                            borderRadius: BorderRadius.circular(10.0),
                            //below line is for rectangular shape
                            shape: BoxShape.rectangle,
                            //you can change opacity with color here(I used black) for rect
                            color: Colors.black.withOpacity(0.5),
                            //I added some shadow, but you can remove boxShadow also.
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenwidth - 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: AppColor().redcolor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: Text(
                                      'PLEASE CHOOSE AN OPTION',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor().textwhitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenwidth - 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: AppColor().whitecolor,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CheckBoxAndReportContent(
                                        passCheckBoxValue: checkbox1,
                                        passCheckBoxText:
                                            'Sensitive Content (Nudity, Violence)',
                                        passonChangedCheckBox: (value) {
                                          setState(() {
                                            checkbox1 = value!;
                                          });
                                        },
                                      ),
                                      CheckBoxAndReportContent(
                                        passCheckBoxValue: checkbox2,
                                        passCheckBoxText:
                                            ' IP/Tradmark Violation',
                                        passonChangedCheckBox: (value) {
                                          setState(() {
                                            checkbox2 = value!;
                                          });
                                        },
                                      ),
                                      CheckBoxAndReportContent(
                                        passCheckBoxValue: checkbox3,
                                        passCheckBoxText:
                                            'Threats, Incitement, or Bullyin',
                                        passonChangedCheckBox: (value) {
                                          setState(() {
                                            checkbox3 = value!;
                                          });
                                        },
                                      ),
                                      CheckBoxAndReportContent(
                                        passCheckBoxValue: checkbox4,
                                        passCheckBoxText:
                                            'Unsolicited Advertising',
                                        passonChangedCheckBox: (value) {
                                          setState(() {
                                            checkbox4 = value!;
                                          });
                                        },
                                      ),
                                      CheckBoxAndReportContent(
                                        passCheckBoxValue: checkbox5,
                                        passCheckBoxText:
                                            'Illegal Child-Related Concern',
                                        passonChangedCheckBox: (value) {
                                          setState(() {
                                            checkbox5 = value!;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Comments about the report',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor().tealcolor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              AppColor().greylightsecondcolor,
                                        ),
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: AppColor().textcolor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 4,
                                          initialValue: aboutval,
                                          decoration:
                                              containertextfeilddecoration(),
                                          validator: ((value) => value!.isEmpty
                                              ? "Please Provide information about you"
                                              : null),
                                          onChanged: ((value) {
                                            aboutval = value.isEmpty
                                                ? aboutval
                                                : value;
                                          }),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Consumer<ReportFilePickprovider>(
                                          builder: (context, value, child) {
                                        return GestureDetector(
                                          onTap: () async {
                                            final file = await FilePicker
                                                .platform
                                                .pickFiles(
                                                    // type: FileType.custom,
                                                    // allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf', 'doc'],
                                                    );
                                            if (file == null) {
                                              // if (kDebugMode) {
                                              //   print('something wrong');
                                              // }
                                            } else {
                                              value.setFile(
                                                passfile: file,
                                              );
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: screenwidth - 80,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Image.asset(
                                                  reportImg,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 45,
                                                child: Center(
                                                  child: Text(
                                                    value.fileone != null
                                                        ? 'File selected'
                                                        : 'Click to upload a file/screenshot',
                                                    style: TextStyle(
                                                      color: value.fileone !=
                                                              null
                                                          ? AppColor().tealcolor
                                                          : AppColor()
                                                              .textcolor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Consumer<ReportUserViewModel>(
                                            builder: (context, valueOfViewModel,
                                                child) {
                                          return PrimaryButtonLoading(
                                            buttonText: valueOfViewModel
                                                        .reportloading ==
                                                    false
                                                ? Text(
                                                    'Next',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor()
                                                          .textwhitecolor,
                                                    ),
                                                  )
                                                : customcircularprogress(
                                                    passcolor:
                                                        AppColor().whitecolor,
                                                  ),
                                            passOnTap: () async {
                                              String? check1;
                                              String? check2;
                                              String? check3;
                                              String? check4;
                                              String? check5;
                                              debugPrint(
                                                  widget.userId.toString());
                                              debugPrint(
                                                  'checkbox1.toString()');
                                              debugPrint(checkbox2.toString());
                                              debugPrint(checkbox3.toString());
                                              if (checkbox1 == true) {
                                                check1 =
                                                    'Sensitive Content (Nudity, Violence)';
                                              }
                                              if (checkbox2 == true) {
                                                check2 =
                                                    'IP/Tradmark Violation';
                                              }
                                              if (checkbox3 == true) {
                                                check3 =
                                                    'Threats, Incitement, or Bullying';
                                              }
                                              if (checkbox4 == true) {
                                                check4 =
                                                    'Unsolicited Advertising';
                                              }
                                              if (checkbox5 == true) {
                                                check5 = 'Illegal';
                                              }

                                              debugPrint('check1.toString()');
                                              debugPrint(check1.toString());
                                              debugPrint(check2.toString());
                                              debugPrint(check3.toString());
                                              debugPrint(check4.toString());
                                              debugPrint(check5.toString());
                                              if (reportFilePickprovider
                                                      .fileone ==
                                                  null) {
                                                Utils.toastMessage(
                                                    message:
                                                        'Please select File');
                                              } else {
                                                debugPrint(
                                                    'before upload and add path list length');
                                                debugPrint(
                                                    reportFilePickprovider
                                                        .fileListPaths.length
                                                        .toString());
                                                reportFilePickprovider
                                                    .setListtoNull();
                                                uploadImage(
                                                  context,
                                                ).then((value) async {
                                                  debugPrint(
                                                      'After upload and add path list length');
                                                  debugPrint(
                                                      reportFilePickprovider
                                                          .fileListPaths.length
                                                          .toString());
                                                  FormData data;

                                                  data = FormData.fromMap({
                                                    'report_to': widget.userId,
                                                    'comment': aboutval,
                                                    'attachments[]':
                                                        reportFilePickprovider
                                                            .fileListPaths,
                                                    'data[0][text]': check1,
                                                    'data[1][text]': check2,
                                                    'data[2][text]': check3,
                                                    'data[3][text]': check4,
                                                    'data[4][text]': check5,
                                                  });
                                                  valueOfViewModel
                                                      .reportUserApi(
                                                    data,
                                                    context,
                                                  );
                                                });
                                              }
                                            },
                                          );
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage(
    BuildContext context,
  ) async {
    final reportFilePickprovider =
        Provider.of<ReportFilePickprovider>(context, listen: false);
    reportFilePickprovider.fileListPaths.add(await MultipartFile.fromFile(
      reportFilePickprovider.fileone?.paths[0],
      filename: 'imageFiles333.path',
    ));
  }
}
