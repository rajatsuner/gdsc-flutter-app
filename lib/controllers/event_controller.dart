import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/models/event_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EventController extends GetxController {
  var eventData = {"past": <EventModel>[], "upcoming": <EventModel>[]};
  late DatabaseReference _pastEventRef;
  late DatabaseReference _upcomingEventRef;
  var shimmerEnabled = {"past": true, "upcoming": true};

  @override
  void onInit() {
    print("EVENT COTNROLLEER ONINT");
    fetchUpcomingEventDetails();
    fetchPastEventDetails();
    super.onInit();
  }

  fetchUpcomingEventDetails() async {
    _upcomingEventRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://gdsc-ipsa-86efa-default-rtdb.asia-southeast1.firebasedatabase.app")
        .ref("upcomingEvents");

    try {
      final eventSnapshot = await _upcomingEventRef.get();
      var children = eventSnapshot.children;
      for (var child in children) {
        Map<dynamic, dynamic> data = jsonDecode(jsonEncode(child.value));
        eventData["upcoming"]!.add(EventModel(
            title: data["title"],
            iconUrl: data["thumbnaillink"],
            bannerUrl: data["posterlink"],
            date: data["date"],
            time: data["time"],
            address: data["mode"],
            about: data["shortdesc"],
            eventPageUrl: data["eventlink"],
            eventId: data["eventId"]));
      }
      shimmerEnabled["upcoming"] = false;
    } catch (e) {
      print("EROR : $e");
    }

    update();
  }

  fetchPastEventDetails() async {
    _pastEventRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL:
                "https://gdsc-ipsa-86efa-default-rtdb.asia-southeast1.firebasedatabase.app")
        .ref("pastEvents");

    try {
      final eventSnapshot = await _pastEventRef.get();
      var children = eventSnapshot.children;
      for (var child in children) {
        Map<dynamic, dynamic> data = jsonDecode(jsonEncode(child.value));
        eventData["past"]!.add(EventModel(
            title: data["title"],
            iconUrl: data["thumbnaillink"],
            bannerUrl: data["posterlink"],
            date: data["date"],
            time: data["time"],
            address: data["mode"],
            about: data["shortdesc"],
            eventPageUrl: data["eventlink"],
            eventId: data["eventId"]));
      }
      shimmerEnabled["past"] = false;
    } catch (e) {
      print("EROR : $e");
    }
    update();
  }
}
