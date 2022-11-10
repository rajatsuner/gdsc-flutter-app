import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainLeadWidget extends StatelessWidget {
  const MainLeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Container(
        //    height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 249, 250, 249),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage("assets/general_images/kotlin.png"),
              ),
              SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Mohit Gupta",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Flutter lead"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
