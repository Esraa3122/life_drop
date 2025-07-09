import 'package:flutter/material.dart';
import 'package:life_drop/core/extensions/context_extension.dart';

class CustomBottomSheet {
  const CustomBottomSheet._();

  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet<dynamic>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          backgroundColor: backgroundColor ?? context.color.bluePinkDark,
          isScrollControlled: true,
          barrierColor: Colors.transparent,
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: widget,
                ),
              ),
            );
          }).whenComplete(whenComplete ?? () {});
}
