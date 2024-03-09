import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // Define your animation properties using TimelineTween
    final tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration(milliseconds: 0),
              duration: Duration(milliseconds: 500))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
          .animate(AniProps.translateY,
              tween: Tween(begin: -30.0, end: 0.0), curve: Curves.easeOut);

    // Use CustomAnimation widget to apply the animations
    return CustomAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}

// Enum to identify each property that will be animated
enum AniProps { opacity, translateY }
