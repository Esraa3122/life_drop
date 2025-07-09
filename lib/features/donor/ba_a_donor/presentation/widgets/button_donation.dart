import 'package:flutter/material.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';

class ButtonDonation extends StatelessWidget {
  const ButtonDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              context.translate(LangKeys.donateNow),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
          );
  }
}
