import 'package:flutter/material.dart';
import 'package:front_end/screen/store/screen_store.dart';
import 'package:front_end/source/test_DB.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget foodListButton(BuildContext context, String name, String iconDir) {
  return Column(
    children: [
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return StoreScreen(category: name);
            }));
          },
          icon: Image.asset(
            iconDir,
            width: 25,
            height: 25,
          )),
      Text(name),
    ],
  );
}

Widget storeCard(
    BuildContext context, String name, String img, var width, var height) {
  return GestureDetector(
    onTap: () {
      print('Clicked on $name'); // 카드 클릭 시 메시지 출력
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width, // 원하는 너비
          height: height, // 원하는 높이
          child: Card(
            color: const Color.fromARGB(255, 246, 247, 255),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  width: 1.5), // 테두리 추가
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // 카드와 동일한 둥근 모서리
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
          children: [
            Text("  " + name + " "),
            Icon(
              Icons.star_rounded,
              size: height * 0.12,
            ),
            Text("4.5")
          ],
        ),
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.05, width * 0.02,
                width * 0.05, width * 0.02), // 텍스트 주변 여백
            child: Container(
              alignment: Alignment.centerLeft, // 왼쪽 정렬
              child: Text(
                '배달의 민족 \n에서 맛있는 음식을 시켜보아요',
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
                child: Row(children: mkFoodList(context)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.05, width * 0.02,
                width * 0.05, width * 0.01), // 텍스트 주변 여백
            child: Container(
              alignment: Alignment.centerLeft, // 왼쪽 정렬
              child: Text(
                '오늘의 추천 메뉴',
                style: TextStyle(fontSize: 18), // 텍스트 크기 조정
                textAlign: TextAlign.left, // 왼쪽 정렬
              ),
            ),
          ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: mkStoreCardList(context, screenSize),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> mkFoodList(BuildContext context) {
  List<Widget> foodList = [];
  for (int i = 0; i < 2 * FoodList.foodList.length - 1; i++) {
    if (i % 2 == 1) {
      foodList.add(SizedBox(width: 10));
    } else {
      int idx = (i / 2).toInt();
      foodList.add(foodListButton(context, FoodList.foodList[idx].name,
          FoodList.foodList[idx].iconDir));
    }
  }
  return foodList;
}

List<Widget> mkStoreCardList(BuildContext context, Size size) {
  return RecommendStoreList.storeList
      .map((store) => storeCard(context, store.name, store.imageURL!,
          size.width * 0.43, size.height * 0.15))
      .toList();
}
