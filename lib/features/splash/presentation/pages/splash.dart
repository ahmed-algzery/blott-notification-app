import 'package:flutter/material.dart';
import 'package:newstask/features/name/presentation/pages/name.dart';
import 'package:newstask/features/splash/presentation/widgets/splash_body.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation for 2 seconds
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Name(),
          ), // Navigate to News screen
        );
      },
    );

    return const Scaffold(
      backgroundColor: Colors.black,
      body: SplashBody(),
    );
  }
}
