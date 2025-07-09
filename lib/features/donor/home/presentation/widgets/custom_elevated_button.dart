import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtom extends StatelessWidget {
  const CustomElevatedButtom(
      {super.key,
      // required this.text,
      required this.backgroundcolor,
      // this.color,
      // this.over, 
      required this.onTap, required this.child, this.height, this.width});

  // final String text;
  final Color? backgroundcolor;
  // final Color? color;
  // final Color? over;
  final Widget child;
  final double? height;
  final double? width;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? 44.h,
          width: width ?? 44.w,
          decoration: ShapeDecoration(
          shadows: List.filled(12, BoxShadow(color: Colors.grey,offset: Offset(1, 1))),
          color: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Center(child: child),       
        ),
      ),
      // ElevatedButton(
      //   onPressed: () async {},
      //   style: ButtonStyle(
      //       elevation: MaterialStatePropertyAll(5),
      //       shadowColor: MaterialStatePropertyAll(Colors.grey),
      //       fixedSize: MaterialStatePropertyAll(Size(250, 60)),
      //       shape: MaterialStatePropertyAll(
      //         RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15))),
      //       overlayColor: MaterialStatePropertyAll(
      //         over,
      //       ),
      //       backgroundColor: MaterialStatePropertyAll(backgroundcolor)),
      //   child: Text(
      //     text,
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeightHelper.bold,
      //       color: color,
      //     ),
      //   ),
      // ),
    );
  }
}
