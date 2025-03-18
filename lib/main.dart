import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yemen_offers/app_home.dart';
import 'package:yemen_offers/core/binding/core_binding.dart';
import 'package:yemen_offers/core/cache/hive_config.dart';
import 'package:yemen_offers/core/utils/redirect_urls.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveConfig.init();
  AppBinding().dependencies();

  runApp(const AppHome());
}
