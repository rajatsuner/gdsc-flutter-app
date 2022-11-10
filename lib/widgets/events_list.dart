import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/controllers/event_controller.dart';
import 'package:gdsc_ipsa/screens/specific_event_info_page.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class EventsListWidget extends StatelessWidget {
  late String eventSituation;
  EventsListWidget({super.key, required this.eventSituation});
  EventController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 180,
        //   margin: EdgeInsets.only(top: 15),
        child: GetBuilder<EventController>(builder: (context) {
          return eventController.eventData[eventSituation]!.length == 0
              ? ListView.separated(
                  separatorBuilder: ((context, index) => SizedBox(
                        width: 10,
                      )),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 200,
                        width: 150,
                        child: Image.asset(Assets.eventFinding),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 250, 249),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    );
                  },
                )
              : ListView.separated(
                  separatorBuilder: ((context, index) => SizedBox(
                        width: 10,
                      )),
                  scrollDirection: Axis.horizontal,
                  itemCount: eventController.eventData[eventSituation]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(SpecificEventInfoPage(
                            eventInfo: eventController
                                .eventData[eventSituation]![index]));
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            //// height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 249, 250, 249),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    height: 100,
                                    fit: BoxFit.scaleDown,
                                    imageUrl:
                                        "${eventController.eventData[eventSituation]![index].iconUrl}",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${eventController.eventData[eventSituation]![index].title}",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "${eventController.eventData[eventSituation]![index].date}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        }));
  }
}
