import 'package:flutter/material.dart';
import 'package:life_drop/core/style/images/app_images.dart';

class NoNetWorkScreen extends StatelessWidget {
  const NoNetWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.noNetwork), fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
