import 'package:flutter_phoenix_academy/config/routes.dart';
import 'package:flutter_phoenix_academy/presentation/home/home_binding.dart';
import 'package:flutter_phoenix_academy/presentation/home/home_view.dart';
import 'package:flutter_phoenix_academy/presentation/login/login_binding.dart';
import 'package:flutter_phoenix_academy/presentation/login/login_view.dart';
import 'package:flutter_phoenix_academy/presentation/onboarding/onboarding_view.dart';
import 'package:get/get.dart';

class Pages {
  Pages._();

  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnBoardingView(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      transition: Transition.rightToLeftWithFade,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      transition: Transition.rightToLeftWithFade,
      binding: HomeBinding(),
    ),
  ];
}
