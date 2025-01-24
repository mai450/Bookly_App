import 'package:flutter/material.dart';

class AnimatesText extends StatelessWidget {
  const AnimatesText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Center(
            child: Text('Read free Books'),
          ),
        );
      },
    );
  }
}
