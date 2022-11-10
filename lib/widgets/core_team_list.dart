import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/controllers/team_detail_controller.dart';
import 'package:get/get.dart';

class CoreTeamListWidget extends StatelessWidget {
  String type;
  CoreTeamListWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    TeamDetailsController teamDetailsController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<TeamDetailsController>(builder: (context) {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
            ),
            itemCount: teamDetailsController.teamData[type]!.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                child: Container(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          //    color: Color.fromARGB(255, 249, 250, 249),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  "${teamDetailsController.teamData[type]![index].imageUrl}",
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                      radius: 40,
                                      foregroundImage: imageProvider),
                              placeholder: (context, url) => Icon(Icons.person),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${teamDetailsController.teamData[type]![index].name}",
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${teamDetailsController.teamData[type]![index].role}",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (teamDetailsController.teamData[type]![index]
                                        .linkedin.length !=
                                    0)
                                  GestureDetector(
                                    onTap: () => teamDetailsController
                                        .openSocialLink(teamDetailsController
                                            .teamData[type]![index].linkedin),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        Assets.linkedin,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                if (teamDetailsController
                                        .teamData[type]![index].github.length !=
                                    0)
                                  GestureDetector(
                                    onTap: () => teamDetailsController
                                        .openSocialLink(teamDetailsController
                                            .teamData[type]![index].github),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        Assets.github,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                if (teamDetailsController.teamData[type]![index]
                                        .instagram.length !=
                                    0)
                                  GestureDetector(
                                    onTap: () => teamDetailsController
                                        .openSocialLink(teamDetailsController
                                            .teamData[type]![index].instagram),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        Assets.instagram,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                if (teamDetailsController.teamData[type]![index]
                                        .twitter.length !=
                                    0)
                                  GestureDetector(
                                    onTap: () => teamDetailsController
                                        .openSocialLink(teamDetailsController
                                            .teamData[type]![index].twitter),
                                    child: Image.asset(
                                      Assets.twitter,
                                      height: 25,
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
