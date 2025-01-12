import 'package:flutter/material.dart';
import 'package:front_end/model/store.dart';

class StoreInfoScreen extends StatelessWidget {
  Store store;
  StoreInfoScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(left: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          Text(
            '상호명 : ' + store.name,
            style: TextStyle(fontSize: width * 0.048),
          ),
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          Text(
            '가게 번호 : ' + store.number,
            style: TextStyle(fontSize: width * 0.048),
          ),
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          Text(
            '가게 주소 : ' + store.address,
            style: TextStyle(fontSize: width * 0.048),
          ),
          Padding(padding: EdgeInsets.only(top: height * 0.02)),
          Text(
            '카테고리 : ' + store.category.toString(),
            style: TextStyle(fontSize: width * 0.048),
          ),
        ],
      ),
    ));
  }
}
