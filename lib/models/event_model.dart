class EventModel {
  String iconUrl;
  String bannerUrl;
  String title;
  String date;
  String time;
  String address;
  String about;
  String eventPageUrl;
  String eventId;

  EventModel(
      {required this.title,
      required this.iconUrl,
      required this.bannerUrl,
      required this.date,
      required this.time,
      required this.address,
      required this.about,
      required this.eventPageUrl,
      required this.eventId});
}
