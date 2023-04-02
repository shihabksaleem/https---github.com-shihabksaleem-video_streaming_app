import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:video_streaming_app/screens/add_video_screen/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionDialogue(context),
          child: Container(
            height: 50,
            width: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                'Add Video',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showOptionDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                    onPressed: () => pickVideo(ImageSource.gallery, context),
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          size: 40,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
                SimpleDialogOption(
                    onPressed: () => pickVideo(ImageSource.camera, context),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 40,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ))
              ],
            ));
  }

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ConfirmScreen(videoFile: File(video.path), videoPath: video.path),
      ));
    }
  }
}
