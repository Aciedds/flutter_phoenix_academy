import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/routes.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (FirebaseAuth.instance.currentUser != null) {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}
