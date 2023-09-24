import 'package:flutter/material.dart';
import 'package:v_care_app/features/register/presentation/views/register_page.dart';
import 'package:v_care_app/features/splash/presentation/views/widgets/sliding_text.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../on_boarding/presentation/views/on_boarding_screen.dart';




class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimations();
    initNavigateToHomeView();

  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void initSlidingAnimations(){
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void initNavigateToHomeView(){
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return const OnBoardingScreen();
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    return   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 220,
            width: 190,
            child: Image.asset(AssetsData.logo,),
          ),
          const SizedBox(
            height: 15,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ]);
  }
}