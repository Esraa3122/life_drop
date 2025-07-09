import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/toast/show_toast.dart';
import 'package:life_drop/core/common/widgets/custom_linear_button.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/auth/presentation/bloc/auth_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.mapOrNull(success: (_) {
          ShowToast.showToastSuccessTop(
            message: context.translate(LangKeys.loggedSuccessfully),
          );
          context.pushNamedAndRemoveUntil(AppRoutes.mainDonor);
        }, error: (message) {
          ShowToast.showToastErrorTop(
            message: context.translate(LangKeys.loggedError),
          );
        });
      },
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return CustomLinearButton(
              onPressed: () {},
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ));
        }, orElse: () {
          return CustomFadeInRight(
            duration: 600,
            child: CustomLinearButton(
                onPressed: () {
                  _validateThenDoSignUp(context);
                },
                height: 55.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                    text: context.translate(LangKeys.sinup),
                    theme: context.textStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeightHelper.bold,
                    ))),
          );
        });
      },
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();

    if (authBloc.formKey.currentState!.validate() ||
        imageCubit.getImageUrl.isEmpty) {
      if (imageCubit.getImageUrl.isEmpty) {
        if (imageCubit.getImageUrl.isEmpty) {
          ShowToast.showToastErrorTop(
              message: context.translate(LangKeys.validPickImage));
        }
      } else {
        context
            .read<AuthBloc>()
            .add(AuthEvent.signUp(imagUrl: imageCubit.getImageUrl));
      }
    }
  
  }
}
