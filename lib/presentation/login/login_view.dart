import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/routes.dart';
import 'package:flutter_phoenix_academy/presentation/constants/color_contants.dart';
import 'package:flutter_phoenix_academy/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Error Text",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_outlined),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Error Text",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.offNamed(Routes.HOME),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
