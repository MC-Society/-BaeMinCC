import 'package:flutter/material.dart';
import 'package:front_end/model/store.dart';

class StoreBtn extends StatefulWidget {
  Store store;
  Size screenSize;
  StoreBtn(this.store, this.screenSize);

  @override
  State<StoreBtn> createState() => _StoreBtnState();
}

class _StoreBtnState extends State<StoreBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenSize.width * 0.9,
      height: widget.screenSize.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1)),
      child: InkWell(
          onTap: () {
            print(widget.store.category);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.store.name,
                style: TextStyle(fontSize: widget.screenSize.width * 0.06),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.store.address,
                    style: TextStyle(fontSize: widget.screenSize.width * 0.03),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          right: widget.screenSize.width * 0.02)),
                  Text(
                    widget.store.number,
                    style: TextStyle(fontSize: widget.screenSize.width * 0.02),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
