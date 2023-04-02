import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:video_streaming_app/constants.dart';
import 'package:video_streaming_app/controller/comment_controller.dart';

class CommentsScreen extends StatelessWidget {
  CommentsScreen({super.key, required this.id});
  final String id;
  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SizedBox(
            width: size.width,
            height: size.height - 80,
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.comments[index];
                        return ListTile(
                          title: Text(comment.username),
                          subtitle: Text(comment.comment),
                        );
                      },
                    );
                  }),
                ),
                Divider(),
                ListTile(
                  title: TextFormField(
                    cursorColor: Colors.black,
                    controller: _commentController,
                    decoration: InputDecoration(
                        hintText: 'Enter comment',
                        filled: true,
                        fillColor: Colors.grey.shade600,
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                  trailing: IconButton(
                      onPressed: () => commentController
                          .postComment(_commentController.text),
                      icon: Icon(
                        Icons.add_box_rounded,
                        size: 30,
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
