part of 'add_donor_bloc.dart';

@freezed
class AddDonorEvent with _$AddDonorEvent {
  const factory AddDonorEvent.started() = _Started;
  const factory AddDonorEvent.createDonor({
    required AddDonorModel donorModel,
  }) = CreateDonorEvent;
    const factory AddDonorEvent.deleteDonor({
    required AddDonorModel donorModel,
  }) = DeleteDonorEvent;
}
