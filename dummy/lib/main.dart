import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'profile_notifier.dart';
import 'profile_state.dart';
import 'create_profile_page_basic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Provider ko root me inject karna
      home: StateNotifierProvider<ProfileNotifier, ProfileState>(
        create: (_) => ProfileNotifier(),
        child: const CreateProfilePage(),
      ),
    );
  }
}