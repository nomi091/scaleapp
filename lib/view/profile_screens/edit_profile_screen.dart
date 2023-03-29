// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/data/responce/status.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/res/provider/profile_provider/image_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/textfeild_widgets.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/utils.dart';
import 'package:scaleapp/view_model/auth_view_model/user_info_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/other_user_more_info_view_model.dart';
import 'package:scaleapp/view_model/profile_view_model/delete_media_view_model.dart';
import 'package:scaleapp/view_model/profile_view_model/update_profile_view_model.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  final ImagePicker picker = ImagePicker();

  /// multiple images ///
  final ImagePicker imagePicker = ImagePicker();

  // final List<XFile> imageFileList = [];
  List imageFileListPaths = [];
  final _formKey = GlobalKey<FormState>();
  UserInformationViewModel userInformationViewModel =
      UserInformationViewModel();

  //GetUserProfileViewModel getUserProfileViewModel = GetUserProfileViewModel();
  OtherUserMoreInformationViewModel getUserProfileViewModel =
      OtherUserMoreInformationViewModel();
  Future<UserModel> getUserData() => UserViewModel().getUser();

  /// multiple images ///
  String gender = 'men';

  String? age;
  int? userID;
  String aboutval = 'About my self';

  @override
  void initState() {
    getUserOldDataFunction();
    // final imageViewModel = Provider.of<Imageprovider>(context, listen: false);
    getUserData().then((value) {
      userID = value.id;
    }).then((value) {
      getUserProfileViewModel.otheruserMoreInfoApi(context, userID!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final updateProfileViewModel =
    //     Provider.of<UpdateProfileViewModel>(context, listen: false);
    final userData = Provider.of<UserProfileProvider>(context, listen: false);
    final imageViewModel = Provider.of<Imageprovider>(context, listen: false);
    final screenwidth = MediaQuery.of(context).size.width;
    int neImgCount = 0;
    return WillPopScope(
      onWillPop: () async {
        imageViewModel.removeImage(false);
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            // backgroundColor: AppColor().whispercolor,
            body: SafeArea(
          child: ChangeNotifierProvider<OtherUserMoreInformationViewModel>(
            create: (BuildContext context) => getUserProfileViewModel,
            child: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Center(
                    child: Text(
                      'Edit Profile Info',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColor().textcolor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Consumer<Imageprovider>(builder: (context, value, child) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: 320,
                            width: screenwidth - 50,
                            child: value.image != null
                                ? Stack(
                                    children: [
                                      SizedBox(
                                        height: 320,
                                        width: screenwidth,
                                        child: Image.file(
                                          File(value.image!.path),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            // selectImages();
                                            if (value.image != null) {
                                              value.removeImage(true);
                                            } else {
                                              value.removenetworkImage(false);
                                            }

                                            // setState(() {
                                            //   value.removeImage();
                                            // });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 22,
                                              width: 22,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: AppColor().whitecolor,
                                                borderRadius:
                                                    BorderRadius.circular(80),
                                              ),
                                              child: Icon(
                                                FontAwesomeIcons.xmark,
                                                color: AppColor().appIconcolor,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : userData.userdata.profileImage != null &&
                                        value.showNetwork == true
                                    ? Stack(
                                        children: [
                                          SizedBox(
                                            height: 320,
                                            width: screenwidth,
                                            child: Image.network(
                                              userData.userdata.profileImage!
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: GestureDetector(
                                              onTap: () {
                                                // selectImages();
                                                value.removeImage(true);
                                                value.removenetworkImage(false);
                                                // setState(() {
                                                //   value.removeImage();
                                                // });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 22,
                                                  width: 22,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColor().whitecolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80),
                                                  ),
                                                  child: Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color:
                                                        AppColor().appIconcolor,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: AppColor().containerfillcolor,
                                        ),
                                        child: Column(children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 123, bottom: 45),
                                            child: GestureDetector(
                                              onTap: () {
                                                getFromGallery(value);
                                                // Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.camera_alt,
                                                size: 58,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Click to upload pic 1',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor().switchOffcolor,
                                            ),
                                          ),
                                        ]),
                                      ),
                          ),
                        ),

                        ////////////////////////////////////////////////////////////////////////
                        Consumer<DeleteMediaViewModel>(
                            builder: (context, valueDelete, child) {
                          return Consumer<OtherUserMoreInformationViewModel>(
                              builder: (context, valueOfViewModel, _) {
                            switch (
                                valueOfViewModel.otherusermoreinfoData.status) {
                              case Status.LOADING:
                                return Column(
                                  children: const [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text('Processing...'),
                                  ],
                                );
                              case Status.ERROR:
                                return Text(valueOfViewModel
                                    .otherusermoreinfoData.message
                                    .toString());

                              default:
                                return GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisExtent: 125,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: 6,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // return Text(valueOfViewModel
                                      //     .otherusermoreinfoData.data!.users!.id
                                      //     .toString());
                                      // debugPrint('index.toString()');
                                      // debugPrint(
                                      //     '/////////////////////////////////////');

                                      // debugPrint(
                                      //     '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
                                      // debugPrint(index.toString());
                                      // debugPrint(valueOfViewModel
                                      //     .otherusermoreinfoData
                                      //     .data!
                                      //     .users!
                                      //     .images!
                                      //     .length
                                      //     .toString());
                                      // debugPrint(index.toString());
                                      // debugPrint(value.imageFileList.length
                                      //     .toString());

                                      // debugPrint(valueOfViewModel
                                      //     .otherusermoreinfoData
                                      //     .data!
                                      //     .users!
                                      //     .images!
                                      //     .length
                                      //     .toString());
                                      // debugPrint(index.toString());
                                      if (index >=
                                              valueOfViewModel
                                                  .otherusermoreinfoData
                                                  .data!
                                                  .users!
                                                  .images!
                                                  .length &&
                                          value.imageFileList.length >
                                              index -
                                                  valueOfViewModel
                                                      .otherusermoreinfoData
                                                      .data!
                                                      .users!
                                                      .images!
                                                      .length) {
                                        // debugPrint('neImgCount.toString()');
                                        // debugPrint(neImgCount.toString());
                                        neImgCount = neImgCount + 1;
                                        // debugPrint(
                                        //     'neImgCount.toString() again');
                                        // debugPrint(neImgCount.toString());
                                      }

                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: valueOfViewModel
                                                    .otherusermoreinfoData
                                                    .data!
                                                    .users!
                                                    .images!
                                                    .length >
                                                index
                                            ? Container(
                                                width: 98,
                                                height: 125,
                                                color: AppColor()
                                                    .imagecontainercolor,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 125,
                                                      height: 125,
                                                      child: FadeInImage(
                                                        placeholder:
                                                            const AssetImage(
                                                          allnotificationImg,
                                                        ),
                                                        image: NetworkImage(
                                                            valueOfViewModel
                                                                .otherusermoreinfoData
                                                                .data!
                                                                .users!
                                                                .images![index]
                                                                .url
                                                                .toString()),
                                                        fit: BoxFit.cover,
                                                        imageErrorBuilder:
                                                            (context, object,
                                                                trace) {
                                                          return Image.asset(
                                                            allnotificationImg,
                                                            height: 50,
                                                            width: 50,
                                                            fit: BoxFit.cover,
                                                          );
                                                        },
                                                        height: 50,
                                                        width: 50,
                                                      ),
                                                      // Image.file(
                                                      //   File(value
                                                      //       .imageFileList[index]!.path),
                                                      //   fit: BoxFit.cover,
                                                      // ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // selectImages();
                                                          // setState(() {
                                                          //   value.imageFileList
                                                          //       .removeAt(index);
                                                          // });
                                                          valueDelete.deleteMediaApi(
                                                              context,
                                                              valueOfViewModel
                                                                  .otherusermoreinfoData
                                                                  .data!
                                                                  .users!
                                                                  .images![
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            height: 22,
                                                            width: 22,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColor()
                                                                  .whitecolor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80),
                                                            ),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .xmark,
                                                              color: AppColor()
                                                                  .appIconcolor,
                                                              size: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : value.imageFileList.length >
                                                    index -
                                                        valueOfViewModel
                                                            .otherusermoreinfoData
                                                            .data!
                                                            .users!
                                                            .images!
                                                            .length
                                                ? Container(
                                                    width: 98,
                                                    height: 125,
                                                    color: AppColor()
                                                        .imagecontainercolor,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Stack(
                                                      children: [
                                                        SizedBox(
                                                          width: 125,
                                                          height: 125,
                                                          child: Image.file(
                                                            File(value
                                                                .imageFileList[index -
                                                                    valueOfViewModel
                                                                        .otherusermoreinfoData
                                                                        .data!
                                                                        .users!
                                                                        .images!
                                                                        .length]!
                                                                .path),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              // selectImages();
                                                              // debugPrint(index
                                                              //     .toString());
                                                              // debugPrint(value
                                                              //     .imageFileList[index -
                                                              //         valueOfViewModel
                                                              //             .otherusermoreinfoData
                                                              //             .data!
                                                              //             .users!
                                                              //             .images!
                                                              //             .length]!
                                                              //     .path);
                                                              // debugPrint(value
                                                              //     .imageFileList
                                                              //     .length
                                                              //     .toString());
                                                              // debugPrint(
                                                              //     '\\\\\\\\\\\\\\\\\\\\');
                                                              // debugPrint(neImgCount
                                                              //     .toString());
                                                              setState(() {
                                                                value.removeOneGalleryImage(index -
                                                                    valueOfViewModel
                                                                        .otherusermoreinfoData
                                                                        .data!
                                                                        .users!
                                                                        .images!
                                                                        .length);
                                                                neImgCount =
                                                                    neImgCount--;
                                                              });
                                                              // debugPrint(
                                                              //     '///////////////////');
                                                              // debugPrint(neImgCount
                                                              //     .toString());
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                height: 22,
                                                                width: 22,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColor()
                                                                      .whitecolor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              80),
                                                                ),
                                                                child: Icon(
                                                                  FontAwesomeIcons
                                                                      .xmark,
                                                                  color: AppColor()
                                                                      .appIconcolor,
                                                                  size: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    width: 98,
                                                    height: 125,
                                                    color: AppColor()
                                                        .imagecontainercolor,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Column(children: [
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            selectImages(value);
                                                          },
                                                          child: Container(
                                                            height: 22,
                                                            width: 22,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColor()
                                                                  .tealcolor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80),
                                                            ),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .plus,
                                                              color: AppColor()
                                                                  .whitecolor,
                                                              size: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                      );
                                      // return ImageComponent(
                                      //   onTapAddImage: () {
                                      //     selectImages();
                                      //   },
                                      // );
                                    });
                            }
                          });
                        }),
                        ////////////////////////////////////////////////////////////////////////
                        // GridView.builder(
                        //     padding: const EdgeInsets.symmetric(vertical: 20),
                        //     physics: const BouncingScrollPhysics(),
                        //     shrinkWrap: true,
                        //     gridDelegate:
                        //         const SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 3,
                        //       mainAxisExtent: 125,
                        //       crossAxisSpacing: 12,
                        //       mainAxisSpacing: 12,
                        //       childAspectRatio: 1,
                        //     ),
                        //     itemCount: 6,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return ClipRRect(
                        //         borderRadius: BorderRadius.circular(15),
                        //         child: value.imageFileList.length > index
                        //             ? Container(
                        //                 width: 98,
                        //                 height: 125,
                        //                 color: AppColor().imagecontainercolor,
                        //                 alignment: Alignment.bottomCenter,
                        //                 child: Stack(
                        //                   children: [
                        //                     SizedBox(
                        //                       width: 125,
                        //                       height: 125,
                        //                       child: Image.file(
                        //                         File(value
                        //                             .imageFileList[index]!.path),
                        //                         fit: BoxFit.cover,
                        //                       ),
                        //                     ),
                        //                     Align(
                        //                       alignment: Alignment.bottomCenter,
                        //                       child: GestureDetector(
                        //                         onTap: () {
                        //                           // selectImages();
                        //                           setState(() {
                        //                             value.imageFileList
                        //                                 .removeAt(index);
                        //                           });
                        //                         },
                        //                         child: Padding(
                        //                           padding:
                        //                               const EdgeInsets.all(8.0),
                        //                           child: Container(
                        //                             height: 22,
                        //                             width: 22,
                        //                             alignment: Alignment.center,
                        //                             decoration: BoxDecoration(
                        //                               color:
                        //                                   AppColor().whitecolor,
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       80),
                        //                             ),
                        //                             child: Icon(
                        //                               FontAwesomeIcons.xmark,
                        //                               color:
                        //                                   AppColor().appIconcolor,
                        //                               size: 14,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               )
                        //             : Container(
                        //                 width: 98,
                        //                 height: 125,
                        //                 color: AppColor().imagecontainercolor,
                        //                 alignment: Alignment.bottomCenter,
                        //                 child: Column(children: [
                        //                   const Spacer(),
                        //                   Padding(
                        //                     padding: const EdgeInsets.all(8.0),
                        //                     child: GestureDetector(
                        //                       onTap: () {
                        //                         selectImages(value);
                        //                       },
                        //                       child: Container(
                        //                         height: 22,
                        //                         width: 22,
                        //                         alignment: Alignment.center,
                        //                         decoration: BoxDecoration(
                        //                           color: AppColor().tealcolor,
                        //                           borderRadius:
                        //                               BorderRadius.circular(80),
                        //                         ),
                        //                         child: Icon(
                        //                           FontAwesomeIcons.plus,
                        //                           color: AppColor().whitecolor,
                        //                           size: 14,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ]),
                        //               ),
                        //       );
                        //       // return ImageComponent(
                        //       //   onTapAddImage: () {
                        //       //     selectImages();
                        //       //   },
                        //       // );
                        //     }),
                      ],
                    );
                  }),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, left: 14, bottom: 14, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor().whitecolor,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'About Me',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor().tealcolor,
                                ),
                              ),
                              Text(
                                'Rank : ${userData.userdata.rankNumber.toString()}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor().tealcolor,
                                  height: 1.5,
                                ),
                              ),
                              // Text(
                              //   'About Me',
                              //   style: TextStyle(
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.w600,
                              //     color: AppColor().tealcolor,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          SingleChildScrollView(
                            child: TextFormField(
                              style: TextStyle(
                                  color: AppColor().textcolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              maxLines: 4,
                              initialValue: aboutval,
                              decoration: containertextfeilddecoration(),
                              validator: ((value) => value!.isEmpty
                                  ? "Please Provide information about you"
                                  : null),
                              onChanged: ((value) {
                                aboutval = value.isEmpty ? aboutval : value;
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 20),
                    width: screenwidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor().whitecolor,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 14,
                            ),
                            child: Text(
                              'Your Gender',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor().tealcolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Men",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value: gender == 'man' ? gender : "men",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Women",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value: gender == 'woman' ? gender : "women",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Agender",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value: gender == 'agender' ? gender : "agender",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Bigender",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value: gender == 'bigender' ? gender : "bigender",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Genderfluid",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value: gender == 'genderfluid'
                                ? gender
                                : "genderfluid",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Transman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value: gender == 'transman' ? gender : "transman",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: AppColor().tealcolor,
                            title: Text(
                              "Transwoman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor().textcolor,
                              ),
                            ),
                            value:
                                gender == 'transwoman' ? gender : "transwoman",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 29, left: 14, bottom: 20, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor().whitecolor,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Age:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor().tealcolor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              age.toString().isNotEmpty
                                  ? Container()
                                  : Text(
                                      ' Required',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor().redcolor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            width: 77,
                            child: MyCustomTextField(
                              passcontentpadding:
                                  const EdgeInsets.fromLTRB(15, 14, 5, 14),
                              keyboardType: TextInputType.number,
                              passinputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    (RegExp("[0-9]"))),
                                LengthLimitingTextInputFormatter(14)
                              ],
                              hintText: '10',
                              passinitialValue: age,
                              validator: (val) => int.parse(val.toString()) < 18
                                  ? "below 18 not allowed"
                                  : null,
                              onChanged: (val) {
                                // setState(() {
                                age = val;
                                // debugPrint('age $age');
                                // });
                                // print(val);
                                // print(age);

                                return null;
                              },
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Consumer<Imageprovider>(builder: (context, value, child) {
                    return Consumer<UpdateProfileViewModel>(builder:
                        (context, valueofupdateprofileViewModel, child) {
                      return PrimaryButtonLoading(
                        passOnTap: () async {
                          String profileImgPath1;

                          // print(userData.userdata.profileImage);
                          if (imageViewModel.image == null &&
                              userData.userdata.profileImage == null) {
                            Utils.snackBar(
                              context: context,
                              message: 'Please Select profile Image first',
                              backgroundColor: AppColor().blackcolor,
                              textColor: AppColor().textwhitecolor,
                            );
                          } else {
                            if (kDebugMode) {
                              print(
                                  '////////// here start print statement //////');
                              print(age.toString());
                              print(gender.toLowerCase());
                              print(neImgCount.toString());
                              // print(value.imageFileList[0]!.path.toString());
                              // print(value.imageFileList[1]!.path.toString());

                            }
                            if (int.parse(age.toString()) < 18) {
                              Utils.toastMessage(
                                  message: 'Age Above 18 allowed');
                            } else {
                              if (_formKey.currentState!.validate()) {
                                for (int a = 0; a < neImgCount; a++) {
                                  imageFileListPaths.add(
                                      await MultipartFile.fromFile(
                                          value.imageFileList[a]!.path));
                                }

                                if (imageViewModel.image != null) {
                                  ///
                                  if (gender.toString().toLowerCase() ==
                                      'women') {
                                    gender = 'woman';
                                  }
                                  if (gender.toString().toLowerCase() ==
                                      'men') {
                                    gender = 'man';
                                  }

                                  ///
                                  FormData data = FormData.fromMap({
                                    'age': int.parse(age!),
                                    'gender': gender.toString().toLowerCase(),
                                    'about': aboutval,
                                    'profile_image':
                                        await MultipartFile.fromFile(
                                      imageViewModel.image!.path,
                                    ),
                                    '_method': 'put',
                                    'images[]': imageFileListPaths,
                                  });

                                  // ignore: use_build_context_synchronously
                                  valueofupdateprofileViewModel
                                      .updateProfileApi(data, context);
                                } else {
                                  ///
                                  if (gender.toString().toLowerCase() ==
                                      'women') {
                                    gender = 'woman';
                                  }
                                  if (gender.toString().toLowerCase() ==
                                      'men') {
                                    gender = 'man';
                                  }

                                  ///
                                  FormData data = FormData.fromMap({
                                    'age': int.parse(age!),
                                    'gender': gender.toLowerCase(),
                                    'about': aboutval,
                                    'profile_image': null,
                                    '_method': 'put',
                                    'images[]': imageFileListPaths,
                                  });

                                  // ignore: use_build_context_synchronously
                                  valueofupdateprofileViewModel
                                      .updateProfileApi(data, context);
                                }
                              }
                            }

                            ///////////

                            // for (var image in value.imageFileList) {
                            //   imageFileListPaths.add(
                            //       await MultipartFile.fromFile(image!.path));
                            // }

                          }
                        },
                        buttonText: valueofupdateprofileViewModel
                                    .updateProfileloading ==
                                true
                            ? customcircularprogress(
                                passcolor: AppColor().whitecolor,
                              )
                            : Text(
                                'Done',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor().textwhitecolor,
                                ),
                              ),
                      );
                    });
                  }),
                  const SizedBox(
                    height: 45,
                  ),
                ]),
              ),
            )),
          ),
        )),
      ),
    );
  }

  getFromGallery(value) async {
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
      maxHeight: 800,
      maxWidth: 800,
    );
    value.setImage(file);
  }

  ///
  selectImages(dynamic value) async {
    try {
      final images = await imagePicker.pickMultiImage(
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 50,
      );

      if (images == null) return;
      // for (XFile image in images) {
      // var imagesTemporary = File(image.path);

      // setState(() {
      value.setGalleryImages(images);
      // });
      // print(imagesTemporary.toString());
      // }

      // ignore: empty_catches
    } catch (e) {}
  }

  /////////////// Get User OLD Data ///////////////////////
  Future<void> getUserOldDataFunction() async {
    final userData = Provider.of<UserProfileProvider>(context, listen: false);
    final imageViewModel = Provider.of<Imageprovider>(context, listen: false);
    if (userData.userdata.about != '') {
      aboutval = userData.userdata.about!;
    }
    if (userData.userdata.gender != '') {
      gender = userData.userdata.gender!;
      // debugPrint('gender is a $gender');
    }
    if (userData.userdata.age != 0) {
      age = userData.userdata.age!.toString();
      // debugPrint('age is a $age');
    }

    // if (userData.userdata.gender != '') {
    //   String hereGender = userData.userdata.gender!;
    //   if (hereGender == 'man') {
    //     gender = 'men';
    //   }
    //   if (hereGender == 'woman') {
    //     debugPrint('gender is a $gender');
    //     gender = 'women';
    //   }
    // }
    // debugPrint('gender is a $gender');
    setState(() {});
    // imageViewModel.removeImage(true);
    // imageViewModel.removeGalleryImage(true);
  }
  /////////////// Get User OLD Data ///////////////////////
}
