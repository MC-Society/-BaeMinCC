import 'package:flutter/material.dart';
import 'package:front_end/screen/main/screen_favorite.dart';
import 'package:front_end/screen/main/screen_home.dart';
import 'package:front_end/screen/main/screen_mypage.dart';
import 'package:front_end/screen/main/screen_review.dart';
import 'package:front_end/screen/sign/screen_sign_up.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    ReviewScreen(),
    MyPageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'mypage'),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    ));
  }
}
