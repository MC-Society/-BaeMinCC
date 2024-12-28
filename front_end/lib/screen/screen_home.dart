import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget foodListButton(String name) {
  return Column(
    children: [
      IconButton(onPressed: () {}, icon: Icon(Icons.ice_skating)),
      Text(name)
    ],
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            print("뒤로가기 버튼");
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.05, width * 0.02,
                width * 0.05, width * 0.02), // 텍스트 주변 여백
            child: Container(
              alignment: Alignment.centerLeft, // 왼쪽 정렬
              child: Text(
                '배달의 민족 \n에서 맛있는 음식을 시켜보요zz',
                style: TextStyle(fontSize: 24), // 텍스트 크기 조정
                textAlign: TextAlign.left, // 왼쪽 정렬
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216), // 배경색 설정
                borderRadius: BorderRadius.circular(20), // 둥근 모서리 설정
              ),
              margin: EdgeInsets.all(width * 0.02),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 수평 스크롤 가능
                padding: EdgeInsets.all(width * 0.05),
                child: Row(
                  children: [
                    foodListButton("치킨"),
                    const SizedBox(width: 10), // 버튼 간 간격
                    foodListButton("피자"),
                    const SizedBox(width: 10), // 버튼 간 간격
                    foodListButton("회"),
                    const SizedBox(width: 10), // 버튼 간 간격
                    foodListButton("돈까스"),
                    const SizedBox(width: 10), // 버튼 간 간격
                    foodListButton("면"),
                    const SizedBox(width: 10), // 버튼 간 간격
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
