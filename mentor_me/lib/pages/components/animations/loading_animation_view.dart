import 'package:flutter/material.dart';
import 'package:mentor_me/pages/components/animations/lottie_animation_view.dart';
import 'package:mentor_me/pages/components/animations/models/lottie_animation.dart';

class LoadingAnimationView extends StatelessWidget {
  const LoadingAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return LottieAnimationView(
      animation: LottieAnimation.loading,
      repeat: true,
      width: screenWidth / 3,
      height: screenWidth / 3,
    );
  }
}
