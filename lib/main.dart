import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/color_contants.dart';
import 'package:flutter_phoenix_academy/config/di/injection.dart';
import 'package:flutter_phoenix_academy/config/page.dart';
import 'package:flutter_phoenix_academy/config/routes.dart';
import 'package:flutter_phoenix_academy/config/service/firebase_servie.dart';
import 'package:flutter_phoenix_academy/config/theme/app_theme.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServie.init();
  await configureDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Firebase",
      theme: AppTheme.theme,
      initialRoute: Routes.ONBOARDING,
      getPages: Pages.routes,
    );
  }
}
