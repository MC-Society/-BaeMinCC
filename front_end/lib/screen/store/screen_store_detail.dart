import 'package:flutter/material.dart';
import 'package:front_end/model/store.dart';
import 'package:front_end/screen/store/screen_store_info.dart';
import 'package:front_end/screen/store/screen_store_menu.dart';
import 'package:front_end/screen/store/screen_store_review.dart';

class StoreDetailScreen extends StatefulWidget {
  Store store;

  StoreDetailScreen({super.key, required this.store});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    tabController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                widget.store.name,
                style: TextStyle(
                    fontSize: width * 0.08, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(bottom: height * 0.01)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text('별점 : 4', style: TextStyle(fontSize: width * 0.045)),
                Text('찜 : 23', style: TextStyle(fontSize: width * 0.045)),
                Text('리뷰 수 : 10', style: TextStyle(fontSize: width * 0.045)),
              ]),
              tabBar(),
              Expanded(child: tabBarView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        StoreMenuScreen(store: widget.store),
        StoreInfoScreen(store: widget.store),
        StoreReviewScreen(store: widget.store),
      ],
    );
  }

  Widget tabBar() {
    return TabBar(
      controller: tabController,
      tabs: [
        Tab(text: "메뉴"),
        Tab(text: "정보"),
        Tab(text: "리뷰"),
      ],
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Colors.grey,
    );
  }
}
