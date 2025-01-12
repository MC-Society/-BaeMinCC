import 'package:flutter/material.dart';
import 'package:front_end/source/test_DB.dart';
import 'package:front_end/widget/store_btn.dart';

class StoreScreen extends StatefulWidget {
  String category;

  StoreScreen({required this.category});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
            child: Column(
              children: mkStoreList(widget.category, screenSize),
            ),
          )),
        ));
  }
}

List<Widget> mkStoreList(String category, Size screenSize) {
  List<Widget> storeList = [];
  print(category);
  for (int i = 0; i < StoreList.storeList.length; i++) {
    if (StoreList.storeList[i].category.contains(category)) {
      storeList.add(StoreBtn(StoreList.storeList[i], screenSize));
      storeList.add(
          Padding(padding: EdgeInsets.only(bottom: screenSize.height * 0.03)));
    }
  }
  return storeList;
}
