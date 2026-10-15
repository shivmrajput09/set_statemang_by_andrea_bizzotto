import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  // 1. Initial/Default state
  const factory ProfileState.noError() = _NoError;
  
  // 2. Loading state
  const factory ProfileState.loading() = _Loading;
  
  // 3. Error state (saath mein error message)
  const factory ProfileState.error(String message) = _Error;
}