import 'package:flutter/material.dart';
import 'package:life_drop/core/common/widgets/customer_app_bar.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/features/auth/presentation/refactors/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translate(LangKeys.forgetPassword), backgroundColor: context.color.mainColor,),
      body: ForgetPasswordBody(),
    );
  }
}
