import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/components/menu_components/menu_screen.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/res/widgets/universal_widgets/universal_widgets.dart';
import 'package:scaleapp/utils/constants/colors.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/auth_view_model/logout_view_model.dart';
import 'package:scaleapp/view_model/menu_view_model/delete_account_view_model.dart';
import 'package:scaleapp/view_model/services/profile_services.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final bottomNavProvider =
        Provider.of<BottomNavProvider>(context, listen: false);
    final userData = Provider.of<UserProfileProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenheight,
          width: screenwidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor().textcolor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                userData.userdata.name != ''
                    ? userData.userdata.name.toString()
                    : 'John Dev',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColor().textcolor,
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.filterview,
                  );
                },
                child: const MenuScreenComponent(
                  //iconOnedata: filterImg,
                  iconOnedata: settingImg,
                  //textContent: 'Filter',
                  textContent: 'Settings',
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.notification,
                  );
                },
                child: const MenuScreenComponent(
                  iconOnedata: notificationImg,
                  textContent: 'Notification',
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.matchPrefrences,
                  );
                },
                child: MenuScreenComponent(
                  //iconOnedata: settingImg,
                  iconOnedata: filterImg,
                  // textContent: 'Settings',
                  textContent: 'Search Preferences',
                  passContainerColor: AppColor().walkthroughtwoIconcolor,
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              Consumer<LogOutViewModel>(builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    Profileservices profileservices = Profileservices();
                    profileservices.clearSharedPrefernce(
                      context,
                    );
                    // value.logoutApi(context, bottomNavProvider);
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   RoutesName.chooseLoginSignUp,
                    //   (route) => false,
                    // );
                  },
                  child: MenuScreenComponent(
                    iconOnedata: logoutImg,
                    textContent: 'Log Out',
                    passContainerColor: AppColor().logoutIconContainercolor,
                    passIconColor: AppColor().walkthroughtwoIconcolor,
                  ),
                );
              }),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<DeleteAccountViewModel>(
                    builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      value.deleteAccountApi(context, bottomNavProvider);
                    },
                    child: Container(
                      width: screenwidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColor().menuButtoncolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Center(
                          child: value.deleteAccountloading == true
                              ? customcircularprogress(
                                  passcolor: AppColor().whitecolor,
                                )
                              : Text(
                                  'Delete Account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor().textwhitecolor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
