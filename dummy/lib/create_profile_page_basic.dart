import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_state.dart';
import 'profile_notifier.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // State ko dhyan se sunna (Watch)
    final state = context.watch<ProfileState>();

    // State ke hisaab se UI variables nikalna
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final errorText = state.maybeWhen(
      error: (msg) => msg,
      orElse: () => null,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),
        actions: [
          TextButton(
            onPressed: isLoading ? null : () async {
              // Notifier ko kaam karne ko bolna (Read)
              final success = await context.read<ProfileNotifier>().saveProfile(_controller.text);
              if (success && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile Saved!'))
                );
              }
            },
            child: isLoading 
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          enabled: !isLoading,
          decoration: InputDecoration(
            hintText: 'Enter name',
            errorText: errorText, // Yahan error message aayega
          ),
        ),
      ),
    );
  }
}