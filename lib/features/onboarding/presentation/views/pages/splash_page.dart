import 'package:flutter/material.dart';
import 'package:yemen_offers/core/constants/managers/app_assets.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(children: [Image.asset(AppAssets.appLogo)]),
    );
  }
}
