import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/loading/empty_screen.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/donor/donors/presentation/widgets/donors_item.dart';
import 'package:life_drop/features/donor/search/presentation/bloc/bloc/search_bloc.dart';
import 'package:life_drop/features/donor/search/presentation/widgets/filter_buttons.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: ListView(
        children: [
          // filter buttons
          const FilterButtons(),
          SizedBox(
            height: 20.h,
          ),

          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return state.when(
                  loading: () => Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                          color: context.color.textColor,
                        )),
                      ),
                  success: (donorNewList) => Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return DonorsItem(
                              donorModel: donorNewList[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.h),
                          itemCount: donorNewList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ),
                  empty: EmptyScreen.new,
                  error: Text.new,
                  initial: () {
                    return SizedBox.shrink();
                  });
            },
          ),
        ],
      ),
    );
  }
}

// class SearchBody extends StatelessWidget {
//   const SearchBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
//       child: Column(
//         children: [
//           // filter buttons
//           FilterButtons(),

//           BlocBuilder<SearchBloc, SearchState>(
//             builder: (context, state) {
//               return state.when(
//                   loading: () {
//                     return Expanded(
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           color: context.color.textColor,
//                         ),
//                       ),
//                     );
//                   },
//                   success: (donorNewList) {
//                     return ListView.separated(
//                       itemBuilder: (context, index) {
//                         return DonorsItem(
//                           donorModel: donorNewList[index],
//                           index: index,
//                         );
//                       },
//                       separatorBuilder: (context, index) => SizedBox(
//                         height: 15.h,
//                       ),
//                       itemCount: donorNewList.length,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                     );
//                   },
//                   empty: EmptyScreen.new,
//                   error: Text.new,
//                   initial: () {
//                     return SizedBox.shrink();
//                   });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
