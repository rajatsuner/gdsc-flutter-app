import 'package:flutter/material.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/controllers/team_detail_controller.dart';
import 'package:gdsc_ipsa/widgets/core_team_list.dart';
import 'package:gdsc_ipsa/widgets/team_text_label.dart';
import 'package:get/get.dart';

import '../widgets/line.dart';
import '../widgets/main_lead_widget.dart';

class TeamDetails extends StatelessWidget {
  TeamDetails({super.key});
  var teamDetailsController = Get.put(TeamDetailsController());

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
                  child: Text("GDSC Team",
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
                Assets.teamPageArt,
                height: 200,
                fit: BoxFit.scaleDown,
              ),
            ),
            TeamTextLabel(text: "Founding GDSC Lead"),
            CoreTeamListWidget(type: "main"),
            // MainLeadWidget(),
            TeamTextLabel(text: "GDSC Core Tech Team"),
            CoreTeamListWidget(type: "tech"),
            TeamTextLabel(text: "GDSC Core Non Tech Team"),
            CoreTeamListWidget(type: "nontech"),
          ],
        ),
      ),
    );
  }
}
