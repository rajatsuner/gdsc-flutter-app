import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gdsc_ipsa/models/team_member_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamDetailsController extends GetxController {
  var teamData = {
    "main": <TeamMemberModel>[],
    "tech": <TeamMemberModel>[],
    "nontech": <TeamMemberModel>[]
  };

  @override
  void onInit() {
    print("EVENT COTNROLLEER ONINT");
    fetchTeamDetails(type: "main");
    fetchTeamDetails(type: "tech");
    fetchTeamDetails(type: "nontech");
    super.onInit();
  }

  openSocialLink(String url) {
    print(url);
    launchUrl(Uri.parse(url));
  }

  fetchTeamDetails({required String type}) async {
    DatabaseReference _teamRef;
    // for (var i = 0; i < 10; i++) {
    //   teamData["main"]!.value.add(TeamMemberModel(
    //       name: "Mohit Gupta",
    //       imageUrl: "https://pbs.twimg.com/media/EKUAJ9BUYAASTVJ.png",
    //       role: "LEAD",
    //       linkedin: "",
    //       instagram: "",
    //       github: "",
    //       twitter: ""));
    //   teamData["tech"]!.value.add(TeamMemberModel(
    //       name: "Rajat Suner",
    //       imageUrl: "https://pbs.twimg.com/media/EKUAJ9BUYAASTVJ.png",
    //       role: "Flutter LEAD",
    //       linkedin: "https://www.linkedin.com/in/rajatsuner/",
    //       instagram: "",
    //       github: "",
    //       twitter: ""));
    //   teamData["nontech"]!.value.add(TeamMemberModel(
    //       name: "Ginni Jain",
    //       imageUrl: "https://pbs.twimg.com/media/EKUAJ9BUYAASTVJ.png",
    //       role: "Event management",
    //       linkedin: "",
    //       instagram: "",
    //       github: "",
    //       twitter: ""));
    //
    //  }
    _teamRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://gdsc-ipsa-86efa-default-rtdb.asia-southeast1.firebasedatabase.app")
        .ref(type + "Team");

    try {
      final teamSnapshot = await _teamRef.get();
      var children = teamSnapshot.children;
      for (var child in children) {
        Map<dynamic, dynamic> data = jsonDecode(jsonEncode(child.value));
        teamData[type]!.add(TeamMemberModel(
            name: data["name"],
            imageUrl: data["imageUrl"],
            role: data["role"],
            linkedin: data["linkedin"],
            instagram: data["instagram"],
            github: data["github"],
            twitter: data["twitter"]));
      }
      // shimmerEnabled["upcoming"] = false;
    } catch (e) {
      print("EROR : $e");
    }

    update();
  }
}
