import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/style/colors/colors_light.dart';
import 'package:life_drop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

class SearchForUsers extends StatefulWidget {
  const SearchForUsers({super.key});

  @override
  State<SearchForUsers> createState() => _SearchForUsersState();
}

class _SearchForUsersState extends State<SearchForUsers> {
  @override
  void dispose() {
    context.read<GetAllUsersBloc>().searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        final bloc = context.read<GetAllUsersBloc>();
        return CustomTextField(
          controller: bloc.searchController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Search for users',
          onChanged: (value) {
            bloc.add(GetAllUsersEvent.searchForUser(value));
            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              bloc.searchController.clear();
              bloc.add(GetAllUsersEvent.getAllUsers(isNotLoading: true));
            },
            icon: bloc.searchController.text.isEmpty
                ? const SizedBox.shrink()
                : const Icon(
                    Icons.clear,
                    color: ColorsLight.pinkLight,
                  ),
          ),
        );
      },
    );
  }
}
