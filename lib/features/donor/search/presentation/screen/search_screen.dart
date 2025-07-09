import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/customer_app_bar.dart';
import 'package:life_drop/core/di/injection_container.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/features/donor/search/presentation/bloc/bloc/search_bloc.dart';
import 'package:life_drop/features/donor/search/presentation/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.translate(LangKeys.search),
          backgroundColor: context.color.mainColor,
          color: context.color.textColor,
        ),
        body: const SearchBody(),
      ),
    );
  }
}
