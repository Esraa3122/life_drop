import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';

class SearchCityButton extends StatelessWidget {
  const SearchCityButton({super.key, required this.isSelected, required this.onTap, required this.title,});

  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: 
            isSelected ? context.color.bluePinkDark : context.color.navBarbg,
            borderRadius: BorderRadius.circular(10),
       ),
       child: Center(
        child: TextApp(
          text: title, 
          theme: context.textStyle.copyWith(
            fontWeight: FontWeightHelper.bold,
            fontSize: 15.sp,
          )),
       ),
      ),
    );
  }
}