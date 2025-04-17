import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:yemen_offers/app_home.dart';
import 'package:yemen_offers/core/binding/core_binding.dart';
import 'package:yemen_offers/core/cache/hive_config.dart';
import 'package:yemen_offers/core/services/firebase/firebase_messaging_background_handler.dart';
import 'package:yemen_offers/core/services/firebase/firebase_messaging_service.dart';
import 'package:yemen_offers/core/services/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.init();
  AppBinding().dependencies();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await FirebaseMessagingService.initializeFCM();

  runApp(AppHome());
}
