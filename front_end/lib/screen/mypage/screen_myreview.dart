import 'package:flutter/material.dart';

class MyReviewScreen extends StatefulWidget {
  const MyReviewScreen({super.key});

  @override
  State<MyReviewScreen> createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('myReview'),
    );
  }
}
