import 'package:flutter/material.dart';
import 'package:yemen_offers/app_home.dart';
import 'package:yemen_offers/core/cache/hive_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveConfig.init();
  runApp(const AppHome());
}
