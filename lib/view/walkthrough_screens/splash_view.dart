// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:scaleapp/utils/constants/images_paths.dart';
import 'package:scaleapp/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    // final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            logo,
            width: screenwidth - 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void navigateToNextScreen() async {
    SplashServices splashServices = SplashServices();
    await Future.delayed(const Duration(seconds: 4));
    splashServices.checkAuthentication(context);
  }
}
