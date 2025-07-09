part of 'get_all_donor_bloc.dart';

@freezed
class GetAllDonorEvent with _$GetAllDonorEvent {
  const factory GetAllDonorEvent.started() = _Started;
  const factory GetAllDonorEvent.getAllDonor() = FetchAllDonorEvent;

}