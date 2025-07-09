part of 'add_donor_bloc.dart';

@freezed
class AddDonorState with _$AddDonorState {
  const factory AddDonorState.initial() = _Initial;
  const factory AddDonorState.loading() = _LoadingState;
  const factory AddDonorState.success() = _SuccessState;
  const factory AddDonorState.error({required String error}) = ErrorState;
}
