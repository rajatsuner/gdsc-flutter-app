import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/controllers/event_controller.dart';
import 'package:gdsc_ipsa/screens/certificate_verification_page.dart';
import 'package:gdsc_ipsa/widgets/events_list.dart';
import 'package:gdsc_ipsa/widgets/line.dart';
import 'package:gdsc_ipsa/widgets/text_label.dart';
import 'package:get/get.dart';

class GdscPage extends StatelessWidget {
  GdscPage({super.key});
  var eventController = Get.put(EventController());

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
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(Constants.dsc,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                subtitle: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    Constants.gdscCampusName,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
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
            TextLabel(text: "Upcoming Events"),
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: EventsListWidget(
                  eventSituation: "upcoming",
                )),
            TextLabel(text: "Past Events"),
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: EventsListWidget(
                  eventSituation: "past",
                )),
            SizedBox(
              height: 20,
            ),
            TextLabel(text: "Verify Certificate"),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 10),
              child: Text(
                Constants.certificateVerificationMessage,
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Get.to(CertificateVerificationPage()),
              child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Color.fromARGB(255, 205, 204, 204)),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "CERTIFICATE VERIFICATION",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    )),
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
