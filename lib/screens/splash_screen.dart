import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSignIn();
  }

  _navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo - you can replace this with an actual image
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Pin icon with rays
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Rays
                      ...List.generate(4, (index) {
                        return Transform.rotate(
                          angle: (index * 3.14159 / 2) - 0.5,
                          child: Container(
                            width: 8,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }),
                      // Pin icon
                      const Icon(
                        Icons.location_on,
                        size: 60,
                        color: AppColors.primaryGreen,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Text
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'OurTown',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Ourtownevent.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Event',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Loading indicator
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primaryGreen,
                ),
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
