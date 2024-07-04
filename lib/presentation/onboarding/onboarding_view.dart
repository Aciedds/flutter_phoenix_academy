import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/assets_constants.dart';
import 'package:flutter_phoenix_academy/config/routes.dart';
import 'package:get/get.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsConstants.logo,
              fit: BoxFit.fitWidth,
              width: Get.width * 0.5,
            ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
