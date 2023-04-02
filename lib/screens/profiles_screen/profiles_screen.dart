import 'package:flutter/material.dart';
import 'package:video_streaming_app/controller/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () => AuthController().signOut(),
            icon: Icon(Icons.logout),
            label: Text('Sign Out')),
      ),
    );
  }
}
