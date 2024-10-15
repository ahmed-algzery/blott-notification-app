import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newstask/core/util/responsive_utils.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/Logo.svg',
        fit: BoxFit.fill,
        width: w(context, .60),
      ),
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 700))
        .scaleX(begin: 0.8, end: 1.0)
        .then() // chaining animations for bounce effect
        .scaleY(
            duration: const Duration(milliseconds: 300), begin: 1.0, end: 1.1);
  }
}
