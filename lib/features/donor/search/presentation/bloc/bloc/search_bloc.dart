import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_drop/core/service/hive/hive_database.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';
import 'package:life_drop/features/donor/search/data/models/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    on<SearchForDonorEvent>(_searchForDonor);
  }

  FutureOr<void> _searchForDonor(
      SearchForDonorEvent event, Emitter<SearchState> emit) async {
    emit(SearchState.loading());
    try {
      final donors = HiveDatabase().donorBox!.values.toList();

      final filtered = donors.where((donor) {
        final model = event.searchModel;

        final matchCity = model.City.isNotEmpty
            ? (donor.City)
                .toLowerCase()
                .contains(model.City.toLowerCase())
            : true;

        final matchGov = model.Governorate.isNotEmpty
            ? (donor.Governorate)
                .toLowerCase()
                .contains(model.Governorate.toLowerCase())
            : true;

        final matchCondition = model.Condition.isNotEmpty
            ? (donor.Condition)
                .toLowerCase()
                .contains(model.Condition.toLowerCase())
            : true;

        final matchBlood = model.BloodType.isNotEmpty
            ? (donor.BloodType)
                .toLowerCase()
                .contains(model.BloodType.toLowerCase())
            : true;

        return matchCity && matchGov && matchCondition && matchBlood;
      }).toList();

      if (filtered.isEmpty) {
        emit(const SearchState.empty());
      } else {
        emit(SearchState.success(donorNewList: filtered));
      }
    } catch (e) {
      emit(SearchState.error(error: e.toString()));
    }
  }

  //   try {
  //     await HiveDatabase().searchBox!.add(event.searchModel);

  //     emit(SearchState.success(donorNewList: .donor));
  //   } catch (e) {
  //     emit(SearchState.error(error: e.toString()));
  // }
}
  // FutureOr<void> _createDonor(
  //     CreateDonorEvent event, Emitter<AddDonorState> emit) async {
  //   emit(const AddDonorState.loading());
  //   try {
  //     await HiveDatabase().donorBox!.add(event.donorModel);
  //     emit(const AddDonorState.success());
  //   } catch (e) {
  //     emit(AddDonorState.error(error: e.toString()));
  //   }
  // }