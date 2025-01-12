import 'package:flutter/material.dart';
import 'package:front_end/model/store.dart';

class StoreMenuScreen extends StatefulWidget {
  Store store;
  StoreMenuScreen({super.key, required this.store});

  @override
  State<StoreMenuScreen> createState() => _StoreMenuScreenState();
}

class _StoreMenuScreenState extends State<StoreMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [Text('추후수정')],
      ),
    );
  }
}
