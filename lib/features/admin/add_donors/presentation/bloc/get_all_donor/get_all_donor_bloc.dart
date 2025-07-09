import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_drop/core/service/hive/hive_database.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';

part 'get_all_donor_event.dart';
part 'get_all_donor_state.dart';
part 'get_all_donor_bloc.freezed.dart';

class GetAllDonorBloc extends Bloc<GetAllDonorEvent, GetAllDonorState> {
  GetAllDonorBloc() : super(const GetAllDonorState.loading()) {
    on<FetchAllDonorEvent>(_getAllDonor);
  }

  FutureOr<void> _getAllDonor(
      FetchAllDonorEvent event, Emitter<GetAllDonorState> emit) async {
    try {
      emit(const GetAllDonorState.loading());

      final list = HiveDatabase().donorBox!.values.toList();
      if (list.isEmpty) {
        emit(const GetAllDonorState.empty());
      } else {
        emit(GetAllDonorState.success(donorList: list));
      }
    } catch (e) {
      emit(GetAllDonorState.error(error: e.toString()));
    }
  }
}
