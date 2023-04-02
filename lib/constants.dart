import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:video_streaming_app/screens/add_video_screen/add_video_screen.dart';
import 'package:video_streaming_app/screens/profiles_screen/profiles_screen.dart';

import 'screens/show_video_screen/show_video_screen.dart';

List pages = [
  ShowVideosScreen(),
  const AddVideoScreen(),
  const ProfileScreen(),
];

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
