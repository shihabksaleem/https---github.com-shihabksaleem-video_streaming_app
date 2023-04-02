import 'package:flutter/material.dart';
import 'package:video_streaming_app/constants.dart';
import 'package:video_streaming_app/controller/auth_controller.dart';

import 'widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            pageIndex = index;
            setState(() {});
          },
          backgroundColor: Colors.black,
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_sharp), label: 'Reels'),
            BottomNavigationBarItem(icon: CustomIcon(), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
