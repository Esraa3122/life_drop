import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_drop/core/service/hive/hive_database.dart';
import 'package:life_drop/features/admin/add_donors/data/models/add_donor_model.dart';

part 'add_donor_event.dart';
part 'add_donor_state.dart';
part 'add_donor_bloc.freezed.dart';

class AddDonorBloc extends Bloc<AddDonorEvent, AddDonorState> {
  AddDonorBloc() : super(const _Initial()) {
    on<CreateDonorEvent>(_createDonor);
    on<DeleteDonorEvent>(_deleteDonor);
  }

  FutureOr<void> _deleteDonor(
      DeleteDonorEvent event, Emitter<AddDonorState> emit) async {
    emit(const AddDonorState.loading());
    await event.donorModel.delete();
    emit(const AddDonorState.success());
  }

  FutureOr<void> _createDonor(
      CreateDonorEvent event, Emitter<AddDonorState> emit) async {
    emit(const AddDonorState.loading());
    try {
      await HiveDatabase().donorBox!.add(event.donorModel);
      emit(const AddDonorState.success());
    } catch (e) {
      emit(AddDonorState.error(error: e.toString()));
    }
  }
}
