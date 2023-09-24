import 'package:flutter/material.dart';
import 'package:v_care_app/features/splash/presentation/views/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff174068),
        body: SplashViewBody()
    );
  }
}