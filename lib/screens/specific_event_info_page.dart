import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/models/event_model.dart';
import 'package:gdsc_ipsa/widgets/line.dart';
import 'package:gdsc_ipsa/widgets/text_label.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificEventInfoPage extends StatelessWidget {
  EventModel eventInfo;

  SpecificEventInfoPage({super.key, required this.eventInfo});

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
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  Assets.backButton,
                  height: 25,
                ),
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Event Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              subtitle: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "GDSC IPSA",
                  textAlign: TextAlign.start,
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Line(),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CachedNetworkImage(
              fit: BoxFit.scaleDown,
              imageUrl: eventInfo.bannerUrl,
              errorWidget: (context, url, error) => Text("data"),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Line(),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              eventInfo.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 5),
            child: Text(
              "🗓️ : ${eventInfo.date}",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 5),
            child: Text("⏱️ : ${eventInfo.time}"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 5),
            child: Text("🪧 : ${eventInfo.address}"),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Text(
                eventInfo.about,
                style: TextStyle(fontSize: 14),
              )),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.25),
              child: ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse(eventInfo.eventPageUrl));
                  },
                  child: Text("EVENT PAGE"))),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
