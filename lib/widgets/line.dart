import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double lineThickness = 4;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: width * 0.25,
            height: lineThickness,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3))),
          ),
          Container(
            color: Colors.blue,
            width: width * 0.25,
            height: lineThickness,
          ),
          Container(
            color: Colors.green,
            width: width * 0.25,
            height: lineThickness,
          ),
          Container(
            width: width * 0.25,
            height: lineThickness,
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3))),
          ),
        ],
      ),
    );
  }
}
