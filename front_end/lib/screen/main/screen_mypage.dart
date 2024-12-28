import 'package:flutter/material.dart';
import 'package:front_end/screen/mypage/screen_mycart.dart';
import 'package:front_end/screen/mypage/screen_myorder.dart';
import 'package:front_end/screen/mypage/screen_myreview.dart';
import 'package:front_end/source/test_DB.dart';
import 'package:front_end/widget/mypage_btn.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: height * 0.3),
            ),
            Text(
              UserInfo.userInfo.nickname,
              style: TextStyle(
                  fontSize: width * 0.11, fontWeight: FontWeight.bold),
            ),
            Text(
              UserInfo.userInfo.id,
              style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.only(bottom: height * 0.06),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: mkBtn(screenSize),
            )),
            Container(
              padding: EdgeInsets.only(bottom: height * 0.15),
            ),
          ],
        ),
      )),
    );
  }
}

List<Widget> mkBtn(Size screenSize) {
  List<Widget> mypageBtn = [];
  Map<String, Widget> map = {
    '장바구니': MyCartScreen(),
    '리뷰 관리': MyReviewScreen(),
    '주문 내역': MyOrderScreen(),
  };
  map.forEach((key, value) {
    mypageBtn.add(MyPageBtn(key, value, screenSize));
  });
  return mypageBtn;
}
