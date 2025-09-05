import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/extensions/context_extension.dart';
import 'package:life_drop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

class SearchForUsers extends StatefulWidget {
  const SearchForUsers({super.key});

  @override
  State<SearchForUsers> createState() => _SearchForUsersState();
}

class _SearchForUsersState extends State<SearchForUsers> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = context.read<GetAllUsersBloc>().searchController;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        final bloc = context.read<GetAllUsersBloc>();
        return CustomTextField(
          controller: searchController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Search for users',
          onChanged: (value) {
            bloc.add(GetAllUsersEvent.searchForUser(value));
            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
              bloc.add(GetAllUsersEvent.getAllUsers(isNotLoading: true));
            },
            icon: searchController.text.isEmpty
                ? const SizedBox.shrink()
                : Icon(
                    Icons.clear,
                    color: context.color.bluePinkLight,
                  ),
          ),
        );
      },
    );
  }
}
