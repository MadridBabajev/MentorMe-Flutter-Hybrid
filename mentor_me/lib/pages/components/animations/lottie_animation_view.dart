import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mentor_me/common/extentions/extentions.dart';
import 'package:mentor_me/pages/components/animations/models/lottie_animation.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;
  final double? width;
  final double? height;

  const LottieAnimationView({
    super.key,
    required this.animation,
    this.repeat = false,
    this.reverse = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animation.fullPath,
      reverse: reverse,
      repeat: repeat,
      fit: BoxFit.contain,
      width: width,
      height: height,
    );
  }
}
