import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  // App start hote hi state 'noError' rahegi
  ProfileNotifier() : super(const ProfileState.noError());

  Future<bool> saveProfile(String name) async {
    // 1. Validation Logic
    if (name.trim().isEmpty) {
      state = const ProfileState.error('Naam khali nahi ho sakta');
      return false;
    }

    // 2. Loading State update karna (UI ko batana ki kaam chal raha hai)
    state = const ProfileState.loading();

    // 3. Fake API Call (2 second ka delay)
    await Future.delayed(const Duration(seconds: 2));

    // 4. Server-side validation simulation
    if (name.toLowerCase() == 'shivam') {
      state = const ProfileState.error('Ye naam pehle se registered hai');
      return false;
    }

    // 5. Success
    state = const ProfileState.noError();
    return true; 
  }
}