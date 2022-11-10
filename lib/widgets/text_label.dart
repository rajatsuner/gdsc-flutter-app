import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextLabel extends StatelessWidget {
  late String text;
  TextLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 10, bottom: 5),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}
