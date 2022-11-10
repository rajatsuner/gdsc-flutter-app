import 'package:flutter/material.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/widgets/line.dart';
import 'package:gdsc_ipsa/widgets/text_label.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themer.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
                leading: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("About Us",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    Assets.gdscLogo,
                    fit: BoxFit.scaleDown,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Line(),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                Assets.googleBulb,
                height: 150,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                Constants.aboutUsMessage,
                style: TextStyle(
                    fontSize: 16, wordSpacing: 2, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    Assets.instagram,
                    height: 40,
                  ),
                  Image.asset(
                    Assets.linkedin,
                    height: 40,
                  ),
                  Image.asset(
                    Assets.twitter,
                    height: 40,
                  ),
                  Image.asset(
                    Assets.github,
                    height: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: GestureDetector(
                // onTap: () => Get.to(CertificateVerificationPage()),
                child: Center(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Color.fromARGB(255, 183, 178, 178)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language_outlined,
                            color: Color.fromARGB(255, 98, 116, 221),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "OFFICIAL WEBSITE",
                            style: TextStyle(
                                color: Color.fromARGB(255, 98, 116, 221),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextLabel(text: "Events we conduct"),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Android Study Jams",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Google Cloud Study Jams",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Flutter Festivals",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Open Source Projects",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Hackathons",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Expert Sessions",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "- Info Sessions",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
