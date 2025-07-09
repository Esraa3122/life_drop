import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';

class SigninWithGoogle extends StatelessWidget {
  const SigninWithGoogle({this.height, this.width, super.key});
  final double? height;
  final double? width;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        elevation: MaterialStateProperty.resolveAs(5, Set()),
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
        fixedSize: Size(width ?? 44.w, height ?? 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextApp(
            text: context.translate(LangKeys.loginWithGoogal),
            theme: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.bluePinkDark,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            "assets/images/doner/google photo.png",
            width: 30,
          ),
        ],
      ),
    );
  }
}
