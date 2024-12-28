import 'package:flutter/material.dart';

class MyPageBtn extends StatefulWidget {
  String text;
  Widget screen;
  Size screenSize;

  MyPageBtn(this.text, this.screen, this.screenSize);

  @override
  State<MyPageBtn> createState() => _MyPageBtnState();
}

class _MyPageBtnState extends State<MyPageBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.screenSize.width * 0.5,
        height: widget.screenSize.height * 0.05,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => widget.screen));
          },
          style: ElevatedButton.styleFrom(
              side: BorderSide(width: 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(widget.text),
        ));
  }
}
