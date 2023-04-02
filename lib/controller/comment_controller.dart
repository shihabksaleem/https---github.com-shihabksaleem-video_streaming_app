import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_streaming_app/constants.dart';
import 'package:video_streaming_app/models/comments_model.dart';

class CommentController extends GetxController {
  final Rx<List<CommentsModel>> _comments = Rx<List<CommentsModel>>([]);
  List<CommentsModel> get comments => _comments.value;
  String _postId = '';
  updatePostId(String id) {
    _postId = id;
    getcomments();
  }

  getcomments() {
    _comments.bindStream(firestore
        .collection('videos')
        .doc(_postId)
        .collection('comments')
        .snapshots()
        .map((QuerySnapshot query) {
      List<CommentsModel> returnValue = [];
      for (var element in query.docs) {
        returnValue.add(CommentsModel.fromSnap(element));
      }
      return returnValue;
    }));
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        var allDoc = await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .get();
        int length = allDoc.docs.length;
        CommentsModel comments = CommentsModel(
            username: firebaseAuth.currentUser!.displayName ?? 'Unknown',
            comment: commentText.trim(),
            date: DateTime.now(),
            uid: firebaseAuth.currentUser!.uid,
            id: 'Comment $length');
        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc('Comment $length')
            .set(comments.toJson());
        DocumentSnapshot doc =
            await firestore.collection('videos').doc(_postId).get();
        await firestore.collection('videos').doc(_postId).update({
          'commentCount': (doc.data()! as dynamic)['commentCount'] + 1,
        });
      }
    } catch (e) {
      Get.snackbar('commenting failed', e.toString());
    }
  }
}
