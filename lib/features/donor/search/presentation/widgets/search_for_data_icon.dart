import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';

class SearchForDataIcon extends StatelessWidget {
  const SearchForDataIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search_sharp,
          color: context.color.textColor,
          size: 150,
        ),
        SizedBox(height: 10.h,),
         TextApp(
            text: 'Search For Data', 
            theme: context.textStyle.copyWith(
              fontWeight: FontWeightHelper.bold,
              fontSize: 18.sp
            ),
          ),
      ],
    );
  }
}