import 'package:flutter/material.dart';
import 'package:taskk/screens/onboardingscreen.dart';
import 'package:taskk/utils/constants/Colors.dart';
import 'package:taskk/utils/constants/textstring.dart';
import 'package:taskk/utils/theme/elevatedbuttontheme.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isLightMode = brightness == Brightness.light;

    final containerDecoration = BoxDecoration(
      color: isLightMode ? TColors.white : Colors.black,
      borderRadius: BorderRadius.circular(20),
    );

    final textColor = isLightMode ? TColors.black : TColors.white;

    return Scaffold(
      backgroundColor: TColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/12.png"),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: containerDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/image.png"),
                const SizedBox(height: 5),
                Text(
                  TTexts.SplashScreentext2,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  TTexts.SplashScreentext3,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    TTexts.SplashScreentext4,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButtonTheme(
                  data: TElevatedButtonTheme.lightElevatedButtonTheme,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboarding(),
                        ),
                      );
                    },
                    child: const Text("          Get Started           "),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
