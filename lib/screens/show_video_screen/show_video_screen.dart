import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_streaming_app/constants.dart';
import 'package:video_streaming_app/controller/show_video_controller.dart';
import 'package:video_streaming_app/screens/comments_screen/comments_screen.dart';
import 'package:video_streaming_app/screens/show_video_screen/widget/video_player_item.dart';

class ShowVideosScreen extends StatelessWidget {
  ShowVideosScreen({super.key});
  final ShowVideoController videoController = Get.put(ShowVideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            itemCount: videoController.videoList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  VideoPlayerItem(videoUrl: data.videoUrl),
                  Column(
                    children: [
                      Spacer(),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.caption,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        data.songName,
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            )),
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 4),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        videoController.likeVideo(data.id),
                                    child: data.likes.contains(
                                            firebaseAuth.currentUser!.uid)
                                        ? Icon(
                                            Icons.favorite,
                                            size: 40,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.favorite_outline_rounded,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    '${data.likes.length}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CommentsScreen(id: data.id),
                                        )),
                                    child: const Icon(
                                      Icons.comment,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    data.commentCount.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            });
      }),
    );
  }
}
