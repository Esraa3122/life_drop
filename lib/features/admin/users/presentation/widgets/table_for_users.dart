import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/widgets/text_app.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/style/fonts/font_family_helper.dart';
import 'package:life_drop/core/style/fonts/font_weight_helper.dart';
import 'package:life_drop/features/admin/users/data/models/get_all_users_response.dart';
import 'package:life_drop/features/admin/users/presentation/widgets/delete_user_icon.dart';
import 'package:life_drop/features/admin/users/presentation/widgets/table_cell_title_widget.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({super.key, required this.userList});

  final List<UsersModel> userList;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: context.color.bluePinkLight!),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(60.w),
        1: FixedColumnWidth(90.w),
        2: const FlexColumnWidth(),
        3: FixedColumnWidth(90.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: context.color.bluePinkDark),
          children: [
            //id
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.numbers,
                title: 'id',
              ),
            ),
            // Name
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.person,
                title: 'Name',
              ),
            ),
            // Email
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.email_outlined,
                title: 'Email',
              ),
            ),
            // Delete
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitleWidget(
                icon: Icons.delete_forever,
                title: 'Delete',
              ),
            ),
          ],
        ),
        ...List.generate(
            userList.length,
            (index) => TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextApp(
                          text: userList[index].id ?? '',
                          theme: context.textStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeightHelper.medium,
                              fontFamily: FontFamilyHelper.poppinsEnglish)),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextApp(
                          text: userList[index].name ?? '',
                          theme: context.textStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeightHelper.medium,
                              fontFamily: FontFamilyHelper.poppinsEnglish)),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextApp(
                          text: userList[index].email ?? '',
                          theme: context.textStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeightHelper.medium,
                              fontFamily: FontFamilyHelper.poppinsEnglish)),
                    ),
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: DeleteUserIcon(
                        userId: userList[index].id ?? '',
                      )),
                ]))
      ],
    );
  }
}
