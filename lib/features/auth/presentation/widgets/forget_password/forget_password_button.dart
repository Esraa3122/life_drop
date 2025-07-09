import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/toast/show_toast.dart';
import 'package:life_drop/core/common/widgets/custom_linear_button.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';

class forgetPasswordBotton extends StatefulWidget {
  const forgetPasswordBotton({super.key, this.email});

  final String? email;

  @override
  State<forgetPasswordBotton> createState() => _forgetPasswordBottonState();
}

class _forgetPasswordBottonState extends State<forgetPasswordBotton> {
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
 

   
    return CustomLinearButton(
      onPressed: () async {
        if (formState.currentState!.validate()) {
          try {
            await FirebaseAuth.instance
                .sendPasswordResetEmail(email: widget.email.toString().trim());
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content:
                        Text('Password reset link sent ! check your email '),
                  );
                });
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              ShowToast.showToastErrorTop(message: 'User not found');
            }
          }
        }
      },
      height: 45,
      width: 330.w, 
      child: TextApp(
          text: context.translate(LangKeys.resetPassword),
          theme: context.textStyle.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeightHelper.bold,
          )),
    );
  }
}
