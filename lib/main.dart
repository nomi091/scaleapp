import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleapp/res/provider/about_app_providers/about_app_provider.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:scaleapp/res/provider/bottom_nav_provider/google_location_provider.dart';
import 'package:scaleapp/res/provider/home_provider/report_filepick_provider.dart';
import 'package:scaleapp/res/provider/home_provider/slider_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/edit_profile_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/image_provider.dart';
import 'package:scaleapp/res/provider/profile_provider/user_info_profile_provider.dart';
import 'package:scaleapp/utils/routes/routes.dart';
import 'package:scaleapp/utils/routes/routes_name.dart';
import 'package:scaleapp/view_model/auth_view_model/forget_password_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/login_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/logout_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/rest_password_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/signup_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/update_location_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/user_info_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/user_view_model.dart';
import 'package:scaleapp/view_model/auth_view_model/verify_otp_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/give_rank_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/other_user_like_view_model.dart';
import 'package:scaleapp/view_model/home_other_user_view_model/report_user_view_model.dart';
import 'package:scaleapp/view_model/profile_view_model/delete_media_view_model.dart';
import 'package:scaleapp/view_model/profile_view_model/update_profile_view_model.dart';
import 'package:scaleapp/view_model/services/local_awesome_notifications.dart';
import 'package:scaleapp/view_model/services/local_notification_service.dart';
import 'package:scaleapp/view_model/menu_view_model/filter_view_model.dart';
import 'res/provider/universal_providers/universal_provider.dart';
import 'view_model/home_other_user_view_model/other_user_more_info_view_model.dart';
import 'view_model/menu_view_model/delete_account_view_model.dart';
import 'view_model/menu_view_model/match_preference_view_model.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /// awsome notification ///
  LocalAwesomeNotifications.initialize();

  /// awsome notification ///
  // LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => GooglemapGetAddressProvider()),
        ChangeNotifierProvider(create: (_) => AboutAppProvider()),
        ChangeNotifierProvider(create: (_) => Imageprovider()),
        ChangeNotifierProvider(create: (_) => MatchPrefrencesProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => ReportFilePickprovider()),
        ChangeNotifierProvider(create: (_) => UniversalProvider()),
        // ChangeNotifierProvider(create: (_) => UserAPIprovider()),
        // ChangeNotifierProvider(create: (_) => Scrollprovider()),
        // ChangeNotifierProvider(create: (_) => UsersListViewModel()),

        /// View Models For APi's
        /// Auth View Model
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => LogOutViewModel()),
        ChangeNotifierProvider(create: (_) => DeleteAccountViewModel()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => UpdateProfileViewModel()),
        ChangeNotifierProvider(create: (_) => UserInformationViewModel()),
        ChangeNotifierProvider(
            create: (_) => OtherUserMoreInformationViewModel()),
        ChangeNotifierProvider(create: (_) => UpdateLocationViewModel()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => VerifyOtpViewModel()),
        ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => GiveRankViewModel()),
        ChangeNotifierProvider(create: (_) => ReportUserViewModel()),
        ChangeNotifierProvider(create: (_) => DeleteMediaViewModel()),

        /// Setting View Model
        ChangeNotifierProvider(create: (_) => MatchPreferenceViewModel()),
        ChangeNotifierProvider(create: (_) => FilterViewModel()),

        /// OtherUser Profile View Model
        ChangeNotifierProvider(create: (_) => OtherUserFollowViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            // fontFamily: 'Nunito Sans',
            // textTheme:
            //     GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)
            ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
