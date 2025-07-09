import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/add_donor/add_donor_bloc.dart';
import 'package:life_drop/features/admin/add_donors/presentation/bloc/get_all_donor/get_all_donor_bloc.dart';
import 'package:life_drop/features/donor/donors/presentation/refactors/donors_body.dart';

class DonorsScreen extends StatefulWidget {
  const DonorsScreen({super.key});

  @override
  State<DonorsScreen> createState() => _DonorsScreenState();
}

class _DonorsScreenState extends State<DonorsScreen> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AddDonorBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GetAllDonorBloc>()
          ..add(
            const GetAllDonorEvent.getAllDonor(),
          ),
        ),
        
      ],
      child: Stack(
          children: [
            //body
            DonorsBody(scrollController: scrollController,),
        
            CustomFadeInLeft(
              duration: 200,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: FloatingActionButton(
                    onPressed: scrollUp,
                    backgroundColor: context.color.bluePinkLight,
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        
      ),
    );
  }
}
