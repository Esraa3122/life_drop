part of 'get_all_donor_bloc.dart';

@freezed
class GetAllDonorState with _$GetAllDonorState {
  const factory GetAllDonorState.loading() = _LoadingState;
  const factory GetAllDonorState.success({required List<AddDonorModel> donorList}) = _SuccessState;
  const factory GetAllDonorState.empty() = _EmptyState;
  const factory GetAllDonorState.error({required String error}) = _ErrorState;
}
