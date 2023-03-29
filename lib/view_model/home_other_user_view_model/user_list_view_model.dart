// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scaleapp/data/responce/api_responce.dart';
import 'package:scaleapp/model/home_user_list_model/other_user_list_model.dart';
import 'package:scaleapp/model/user_model/user_model.dart';
import 'package:scaleapp/repository/home_other_user_repo/other_user_list_repo.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/services/profile_services.dart';

class UsersListViewModel with ChangeNotifier {
  // bool _keepload = false;
  // bool get keepload => _keepload;
  final _myrepo = UsersListRepository();
  ApiResponce<UserDataListModel> otherusersprofileData = ApiResponce.loading();

  setotherUsersprofileData(ApiResponce<UserDataListModel> responce, context) {
    otherusersprofileData = responce;
    // debugPrint('Status Default');
    // debugPrint(responce.data?.status.toString());
    if (responce.data?.status == false) {
      // _keepload = true;
      showdialoghere(context);
    }
    // if (responce.data?.status == true) {
    //   debugPrint('rezponse true');
    //   final scrollprovider =
    //       Provider.of<Scrollprovider>(context, listen: false);
    //   debugPrint('scrollprovider.passId.toString()');
    //   debugPrint(scrollprovider.passId.toString());
    //   if (scrollprovider.passId == -1) {
    //     debugPrint('nothing to do scrollprovider.passId -1');
    //   } else {
    //     int? x;
    //     if (otherusersprofileData.data!.users!.isNotEmpty) {
    //       var lis = otherusersprofileData.data!.users!;
    //       x = (lis.indexWhere((i) => i.id == scrollprovider.passId));
    //       debugPrint('$x is req id we found');
    //       debugPrint('$x');
    //       if (x == -1) {
    //         debugPrint('nothing to do');
    //       } else {
    //         otherusersprofileData.data!.users!
    //             .insert(0, otherusersprofileData.data!.users!.removeAt(x));
    //       }
    //     }
    //     debugPrint('$x is req id we found');
    //   }
    // }
    // debugPrint('notifyListeners');
    notifyListeners();
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
  Future<void> otherusersListApi(
    BuildContext context,
  ) async {
    setotherUsersprofileData(ApiResponce.loading(), context);

    getUserData().then((value) {
      String token = value.token.toString();
      // String token = '594|vDsPVehe9oxvhKNZbUs1Jv7UnrUmUqFsxMIth1mg';
      _myrepo.otherUserListApi(token).then((value) {
        setotherUsersprofileData(ApiResponce.completed(value), context);
      }).onError((error, stackTrace) {
        setotherUsersprofileData(ApiResponce.error(error.toString()), context);
      });
    });
  }
}

Future showdialoghere(context) {
  // final bottomNavProvider =
  //     Provider.of<BottomNavProvider>(context, listen: false);
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: const Color(0xFF000000).withOpacity(0.95),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              // contentPadding: const EdgeInsets.fromLTRB(13, 15, 13, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: Material(
                color: Colors.transparent,
                child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              logo,
                              width: 150,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 20.0, right: 20.0),
                          child: Text(
                            "Session Expired Please Login Again",
                            style: TextStyle(
                              color: AppColor().tealcolor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 100,
                          child: PrimaryButton(
                            buttonText: 'Ok',
                            passOnTap: () {
                              // Navigator.pushNamedAndRemoveUntil(
                              //   context,
                              //   RoutesName.chooseLoginSignUp,
                              //   (route) => false,
                              // );
                              Profileservices profileservices =
                                  Profileservices();
                              profileservices.clearSharedPrefernce(
                                context,
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              actions: const <Widget>[],
            ),
          ],
        ),
      );
    },
  );
}
