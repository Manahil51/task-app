import 'package:flutter/material.dart';
import 'package:taskk/screens/login_signup/signup.dart';
import 'package:taskk/utils/constants/Colors.dart';
import 'package:taskk/utils/theme/texttheme.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textTheme =
        isDarkMode ? TTextTheme.DarkTextTheme : TTextTheme.LightTextTheme;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              _buildPage(
                context,
                textTheme,
                'Task Management \n',
                'Lets create a \n',
                'space ',
                'for your \nWorkflow',
              ),
              _buildPage(
                context,
                textTheme,
                'Task Management\n',
                'Work more \n',
                'Structured ',
                'and \n Organized',
              ),
              _buildPage(
                context,
                textTheme,
                'Task Management \n',
                'Manageb your \n',
                'Tasks ',
                'quickly \n for the  result',
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  } else {
                    _pageController.jumpToPage(2);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Implement your action for the last page
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, TextTheme textTheme, String line1,
      String line2, String highlightedLine, String line3) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: line1,
              style: textTheme.headlineMedium?.copyWith(
                color: TColors.primary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: line2,
                  style: textTheme.headlineLarge,
                ),
                TextSpan(
                  text: highlightedLine,
                  style: textTheme.headlineLarge?.copyWith(
                    color: TColors.primary,
                    fontSize: 50,
                  ),
                ),
                TextSpan(
                  text: line3,
                  style: textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: List.generate(3, (index) {
              return Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? TColors.primary : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
