import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/utils/app_regex.dart';
import 'package:life_drop/features/auth/presentation/bloc/auth_bloc.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = true;
  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _bloc.formKey,
        child: Column(
          children: [
            // Email
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: _bloc.emailController,
                prefixIcon: Icon(Icons.email),
                hintText: context.translate(LangKeys.email),
                keyboardType: TextInputType.emailAddress,
                filled: true,
                fillColour: const Color.fromARGB(255, 209, 204, 204),
                validator: (value) {
                  if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                    return context.translate(LangKeys.validEmail);
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 25.h),
            // Password
            CustomFadeInRight(
              duration: 200,
              child: CustomTextField(
                controller: _bloc.passwordController,
                prefixIcon: Icon(Icons.lock),
                hintText: context.translate(LangKeys.password),
                keyboardType: TextInputType.visiblePassword,
                obscureText: isShowPassword,
                filled: true,
                fillColour: const Color.fromARGB(255, 209, 204, 204),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return context.translate(LangKeys.validPassword);
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: context.color.textColor,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
