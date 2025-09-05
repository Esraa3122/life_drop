import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/extensions/context_extension.dart';

class CustomDateField extends StatelessWidget {
  const CustomDateField({super.key, required this.controller, required this.onDateSelected});
  final TextEditingController controller;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: context.color.textColor,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: context.color.textColor,
      ),
      readOnly: true, 
      decoration: InputDecoration(
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: context.color.textFormBorder!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: context.color.textFormBorder!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        hintText: 'Latest Donation',
        hintStyle: context.textStyle.copyWith(
              color: context.color.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
        suffixIcon: Icon(Icons.calendar_today),
        suffixIconColor: context.color.textColor,
         errorStyle: context.textStyle.copyWith(
          color: Colors.red,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select the donor latest donation date';
        }
        return null;
      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          controller.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          onDateSelected(pickedDate); 
        }
      },
    );
  }
}
