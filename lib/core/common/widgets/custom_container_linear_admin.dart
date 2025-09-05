import 'package:flutter/material.dart';
import 'package:life_drop/core/extensions/context_extension.dart';

import 'package:life_drop/core/style/colors/colors_light.dart';

class CustomContainerLinearAdmin extends StatelessWidget {
  const CustomContainerLinearAdmin({
    required this.height,
    required this.width,
    required this.child,
    super.key,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
           context.color.containerLinear2!.withOpacity(0.8),
            context.color.containerLinear1!.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            color:  context.color.containerLinear1!.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: ColorsLight.black.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
