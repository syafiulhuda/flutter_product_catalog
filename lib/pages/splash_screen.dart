import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_consume_api/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(seconds: 4),
      nextScreen: const LoginPage(),
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      splashScreenBody: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Column(
            children: [
              const Text(
                "Welcome There!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Lottie.network(
                // "https://lottie.host/cc7d063b-3fef-4fea-a63b-eada8d4f2b05/Sec82qIVFQ.json"
                'https://lottie.host/f972517a-4c7f-47df-9e89-d6db643eeced/uB0ZI8CYSG.json',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
