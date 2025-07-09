part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _LoadinState;
  const factory SearchState.success({required List<AddDonorModel> donorNewList}) = _SuccessState;
  const factory SearchState.empty() = _EmptyState;
  const factory SearchState.error({required String error}) = _ErrorState;
}
