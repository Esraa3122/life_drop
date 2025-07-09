import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_drop/core/common/animations/animate_do.dart';
import 'package:life_drop/core/common/widgets/custom_text_field.dart';
import 'package:life_drop/core/enums/filter_button_enum.dart';
import 'package:life_drop/features/donor/search/data/models/search_model.dart';
import 'package:life_drop/features/donor/search/presentation/bloc/bloc/search_bloc.dart';
import 'package:life_drop/features/donor/search/presentation/widgets/save_filter_button.dart';
import 'package:life_drop/features/donor/search/presentation/widgets/search_city_gov_button.dart';
import 'package:life_drop/features/donor/search/presentation/widgets/search_for_data_icon.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  FilterButtonsEnum searchEnum = FilterButtonsEnum.non;
  final fromKey = GlobalKey<FormState>();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController govController = new TextEditingController();
  final TextEditingController bloodController = new TextEditingController();
  final TextEditingController conditionController = new TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    govController.dispose();
    bloodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        children: [
          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 200,
                child: SearchCityButton(
                  title: 'Search city',
                  isSelected: searchEnum == FilterButtonsEnum.city,
                  onTap: nameSearchTap,
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchCityButton(
                  title: 'Search blood',
                  isSelected: searchEnum == FilterButtonsEnum.governorate,
                  onTap: () {
                    governorateSearchTap();
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          if (searchEnum == FilterButtonsEnum.city) ...[
            //Search Text Field Name
            CustomFadeInDown(
              duration: 200,
              child: CustomTextField(
                controller: bloodController,
                hintText: 'Search for Blood Types',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Search Name Cant be Empty';
                  }
                  return null;
                },
              ),
            ),
            SaveFilterButton(
              onTap: () {
                if (fromKey.currentState!.validate()) {
                  //call
                  context.read()<SearchBloc>().add(
                        SearchEvent.searchForDonor(
                          searchModel: SearchModel(
                            Governorate: null.toString(),
                            City: cityController.text.trim(),
                            Condition: conditionController.text.trim(),
                            BloodType: bloodController.text.trim(),
                          ),
                        ),
                      );
                  setState(() {
                    searchEnum = FilterButtonsEnum.saved;
                  });
                }
              },
            ),
          ] else if (searchEnum == FilterButtonsEnum.governorate) ...[
            // Search Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: govController,
                      hintText: 'Gov',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Gov Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: bloodController,
                      hintText: 'Blood Types',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Blood Types Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SaveFilterButton(
              onTap: () {
                if (fromKey.currentState!.validate()) {
                  //call
                  context.read()<SearchBloc>().add(
                        SearchEvent.searchForDonor(
                          searchModel: SearchModel(
                            Governorate: govController.text.trim(),
                            City: null.toString(),
                            Condition: conditionController.text.trim(),
                            BloodType: bloodController.text.trim(),
                          ),
                        ),
                      );
                      setState(() {
                        searchEnum = FilterButtonsEnum.saved;
                      });
                }
              },
            ),
          ],
          if (searchEnum == FilterButtonsEnum.saved) ...[
            SizedBox(
              height: 100.h,
            ),
            const SearchForDataIcon(),
          ]
        ],
      ),
    );
  }

  void governorateSearchTap() {
    if (searchEnum == FilterButtonsEnum.governorate) {
      setState(() {
        searchEnum = FilterButtonsEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonsEnum.governorate;
      });
    }
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonsEnum.city) {
      setState(() {
        searchEnum = FilterButtonsEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonsEnum.city;
      });
    }
  }
}
