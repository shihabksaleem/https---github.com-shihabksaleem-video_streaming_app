import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_streaming_app/controller/auth_controller.dart';

import 'widgets/signin_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.video_chat,
              size: 200,
              color: Colors.blue,
            ),
            InkWell(
              onTap: () => AuthController().signInWithGoogle(),
              child: SignInButton(),
            )
          ],
        ),
      ),
    );
  }
}
