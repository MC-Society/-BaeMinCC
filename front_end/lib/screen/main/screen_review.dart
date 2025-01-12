import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int _rating = 0; // 별점 상태를 저장하는 변수

  void _onStarHover(int rating) {
    print("별점 $rating 위에 마우스가 있습니다.");
  }

  void _onStarTap(int rating) {
    setState(() {
      _rating = rating; // 별점 선택 시 상태 업데이트
    });
    print("선택된 별점: $rating");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('리뷰 작성'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            print("뒤로가기 버튼");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 별점 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () => _onStarTap(index + 1),
                  icon: Icon(
                    _rating >= index + 1
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    size: 45,
                    color: _rating >= index + 1 ? Colors.amber : Colors.grey,
                  ),
                );
              }),
            ),
            // 선택된 별점 표시
            Text(
              '선택된 별점: $_rating',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
