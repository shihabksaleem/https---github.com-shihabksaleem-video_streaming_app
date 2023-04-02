import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_streaming_app/models/video_model.dart';
import 'package:video_streaming_app/screens/home_screen/home_screen.dart';

class UploadVideoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoTOStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDocs = await firestore.collection('videos').get();
      int length = allDocs.docs.length;
      String videoUrl = await _uploadVideoTOStorage('video $length', videoPath);
      VideoModel videoModel = VideoModel(
          uid: uid,
          id: 'video $length',
          likes: [],
          commentCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl);
      await firestore
          .collection('videos')
          .doc('video $length')
          .set(videoModel.toJson());
      Get.to(HomeScreen());
    } catch (e) {
      Get.snackbar('Uploading Failed', e.toString());
    }
  }
}
