import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWorkController extends GetxController {
  final GlobalKey<SliverAnimatedListState> listKey =
      GlobalKey<SliverAnimatedListState>();
  RxList<String> homeWorkList = <String>["a", "b", "c", "d"].obs;

}
