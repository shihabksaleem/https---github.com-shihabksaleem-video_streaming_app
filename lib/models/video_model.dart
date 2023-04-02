import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String uid;
  String id;
  List likes;
  int commentCount;

  String songName;
  String caption;
  String videoUrl;
  VideoModel({
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'likes': likes,
        'commentCount': commentCount,
        'songName': songName,
        'caption': caption,
        'videoUrl': videoUrl,
      };
  static VideoModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return VideoModel(
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      songName: snapshot['songName'],
      caption: snapshot['caption'],
      videoUrl: snapshot['videoUrl'],
    );
  }
}
