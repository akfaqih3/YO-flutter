import 'package:flutter/material.dart';
import 'package:yemen_offers/app_home.dart';
import 'package:yemen_offers/core/binding/core_binding.dart';
import 'package:yemen_offers/core/cache/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveConfig.init();
  AppBinding().dependencies();

  runApp(AppHome());
}
