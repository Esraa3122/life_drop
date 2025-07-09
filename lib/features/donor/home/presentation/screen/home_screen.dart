import 'package:flutter/material.dart';
import 'package:life_drop/features/donor/home/presentation/refactors/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
           const HomeBody(),
      ],
    );
  }
}
