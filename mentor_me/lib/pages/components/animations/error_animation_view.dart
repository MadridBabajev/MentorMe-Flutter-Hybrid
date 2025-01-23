import 'package:mentor_me/pages/components/animations/lottie_animation_view.dart';
import 'package:mentor_me/pages/components/animations/models/lottie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(animation: LottieAnimation.error, repeat: false);
}
