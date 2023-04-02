import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsModel {
  final String username;
  final String comment;
  final date;
  final String uid;
  final String id;

  CommentsModel(
      {required this.username,
      required this.comment,
      required this.date,
      required this.uid,
      required this.id});

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'date': date,
        'uid': uid,
        'id': id,
      };

  static CommentsModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CommentsModel(
        username: snapshot['username'],
        comment: snapshot['comment'],
        date: snapshot['date'],
        uid: snapshot['uid'],
        id: snapshot['id']);
  }
}
