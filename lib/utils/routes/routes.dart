import 'package:flutter/material.dart';
import 'package:scaleapp/utils/routes/custom_page_route.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view/about_app_screens/about_app_view.dart';
import 'package:scaleapp/view/about_app_screens/howtouse_app_view.dart';
import 'package:scaleapp/view/about_app_screens/matching_view.dart';
import 'package:scaleapp/view/auth_screens/forget_password_screen.dart';
import 'package:scaleapp/view/auth_screens/location_view.dart';
import 'package:scaleapp/view/auth_screens/login_view.dart';
import 'package:scaleapp/view/auth_screens/privacy_policy_view.dart';
import 'package:scaleapp/view/auth_screens/reset_password_view.dart';
import 'package:scaleapp/view/auth_screens/signup_view.dart';
import 'package:scaleapp/view/auth_screens/verification_view.dart';
import 'package:scaleapp/view/auth_screens/choose_login_signup_view.dart';
import 'package:scaleapp/view/bottom_nav/bottom_nav_bar.dart';
import 'package:scaleapp/view/home/other_user_more_info.dart';
import 'package:scaleapp/view/home/report_user_view.dart';
import 'package:scaleapp/view/menu_screens/filter_view.dart';
import 'package:scaleapp/view/menu_screens/match_prefrences_view.dart';
import 'package:scaleapp/view/menu_screens/notification_view.dart';
import 'package:scaleapp/view/walkthrough_screens/splash_view.dart';
import 'package:scaleapp/view/walkthrough_screens/walkthroughfive_view.dart';
import 'package:scaleapp/view/walkthrough_screens/walkthroughfour_view.dart';
import 'package:scaleapp/view/walkthrough_screens/walkthroughone_view.dart';
import 'package:scaleapp/view/walkthrough_screens/walkthroughthree_view.dart';
import 'package:scaleapp/view/walkthrough_screens/walkthroughtwo_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// WalkThrough FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );

      /// Custom Page Route ///
      case RoutesName.customwalkthroughoneright:
        return CustomPageRoute(
          child: const WalkThroughOneView(),
          direction: AxisDirection.right,
        );

      case RoutesName.customwalkthroughtwoleft:
        return CustomPageRoute(
          child: const WalkThroughTwoView(),
          direction: AxisDirection.left,
        );

      case RoutesName.customwalkthroughtworight:
        return CustomPageRoute(
          child: const WalkThroughThreeView(),
          direction: AxisDirection.left,
        );

      case RoutesName.customwalkthroughthreeleft:
        return CustomPageRoute(
          child: const WalkThroughTwoView(),
          direction: AxisDirection.right,
        );

      case RoutesName.customwalkthroughthreeright:
        return CustomPageRoute(
          child: const WalkThroughFourView(),
          direction: AxisDirection.left,
        );

      case RoutesName.customwalkthroughfourleft:
        return CustomPageRoute(
          child: const WalkThroughThreeView(),
          direction: AxisDirection.right,
        );

      case RoutesName.customwalkthroughfourright:
        return CustomPageRoute(
          child: const WalkThroughFiveView(),
          direction: AxisDirection.left,
        );

      case RoutesName.customwalkthroughfiveright:
        return CustomPageRoute(
          child: const WalkThroughFourView(),
          direction: AxisDirection.right,
        );

      /// Custom Page Route ///

      ///

      case RoutesName.walkthroughone:
        return MaterialPageRoute(
          builder: (BuildContext context) => const WalkThroughOneView(),
        );

      case RoutesName.walkthroughtwo:
        return MaterialPageRoute(
          builder: (BuildContext context) => const WalkThroughTwoView(),
        );

      case RoutesName.walkthroughthree:
        return MaterialPageRoute(
          builder: (BuildContext context) => const WalkThroughThreeView(),
        );

      case RoutesName.walkthroughfour:
        return MaterialPageRoute(
          builder: (BuildContext context) => const WalkThroughFourView(),
        );

      case RoutesName.walkthroughfive:
        return MaterialPageRoute(
          builder: (BuildContext context) => const WalkThroughFiveView(),
        );

      case RoutesName.privacyPolicy:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PrivacyPolicyView(),
        );

      /// /// /// About App FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      case RoutesName.aboutapp:
        final results = settings.arguments as Map;
        final bool homepage = results['homepage'];
        return MaterialPageRoute(
          builder: (BuildContext context) => AboutAppView(
            homepage: homepage,
          ),
        );

      case RoutesName.howtouseapp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HowToUseAppView(),
        );

      case RoutesName.matching:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MatchingView(),
        );

      case RoutesName.filterview:
        return MaterialPageRoute(
          builder: (BuildContext context) => const FilterView(),
        );

      case RoutesName.matchPrefrences:
        return MaterialPageRoute(
          builder: (BuildContext context) => const MatchPrefrencesView(),
        );

      case RoutesName.notification:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotificationView(),
        );

      /// /// Auth FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      case RoutesName.chooseLoginSignUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChooseLoginSignupScreen(),
        );

      case RoutesName.logIn:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RoutesName.forget:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgetScreen(),
        );

      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpView(),
        );

      case RoutesName.resetpassword:
        final results = settings.arguments as Map;
        final String emailfromforgetpasswor = results['emailfromforgetpasswor'];
        return MaterialPageRoute(
          builder: (BuildContext context) => ResetPasswordScreen(
            emailfromforgetpasswor: emailfromforgetpasswor,
          ),
        );

      case RoutesName.verifypin:
        final results = settings.arguments as Map;
        final String emailfromforgetpasswor = results['emailfromforgetpasswor'];
        return MaterialPageRoute(
          builder: (BuildContext context) => VerificationScreen(
            emailfromforgetpasswor: emailfromforgetpasswor,
          ),
        );

      case RoutesName.location:
        return MaterialPageRoute(
          builder: (BuildContext context) => const GoogleLocationView(),
        );

      case RoutesName.bottomnav:
        // final results = settings.arguments as Map;
        // final bool boolScroll = results['boolScroll'];
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavBar(
              // boolScroll: boolScroll
              ),
        );

      case RoutesName.reportUser:
        final results = settings.arguments as Map;
        final int userId = results['userId'];
        return MaterialPageRoute(
          builder: (BuildContext context) => ReportUserView(userId: userId),
        );

      case RoutesName.morepics:
        final results = settings.arguments as Map;
        final int userId = results['userId'];
        final bool chatButton = results['chatButton'];
        final String userName = results['userName'];
        final String userProfile = results['userProfile'];
        return MaterialPageRoute(
          builder: (BuildContext context) => MorePicsScreen(
            userId: userId,
            chatButton: chatButton,
            userName: userName,
            userProfile: userProfile,
          ),
        );

      // case RoutesName.chatscreen:
      //   // final results = settings.arguments as Map;
      //   //   final int userId = results['userId'];
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const ChatView(
      //         // userId: userId,
      //         ),
      //   );

      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      /// when no route found default route
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
