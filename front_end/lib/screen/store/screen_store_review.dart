import 'package:flutter/material.dart';
import 'package:front_end/model/store.dart';

class StoreReviewScreen extends StatefulWidget {
  Store store;

  StoreReviewScreen({super.key, required this.store});

  @override
  State<StoreReviewScreen> createState() => _StoreReviewScreenState();
}

class _StoreReviewScreenState extends State<StoreReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Text('추후수정')],
      ),
    );
  }
}
