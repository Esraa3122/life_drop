import 'package:flutter/material.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';


class TextFildForgetPassword extends StatefulWidget {
  const TextFildForgetPassword({super.key,});
  

  @override
  State<TextFildForgetPassword> createState() => _TextFildForgetPasswordState();
}

class _TextFildForgetPasswordState extends State<TextFildForgetPassword> {
  // late AuthBloc _bloc;
  String? email;
  GlobalKey<FormState> formState = GlobalKey();
 
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formState,
        child: TextFormField(
        onChanged: (data) {email = data;},
        validator: (val) {
          if (val!.isEmpty) {
            return context.translate(LangKeys.validEmail);
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          hintText: context.translate(LangKeys.email),
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: const Color.fromARGB(255, 209, 204, 204),
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.red)),
        )
      )
    );
  }
}