class EventModel {
  final String id;
  final String displayName;
  final String description;
  final String subtitle;
  final int startAt;
  final int endAt;
  final List<dynamic> organizers;
  // final List<Map<String, dynamic>> eventPage;
  // final List<Map<String, dynamic>> registration;
  // final List<Map<String, dynamic>> community;
  // final bool featured;

  EventModel({
    required this.id,
    required this.displayName,
    required this.description,
    required this.subtitle,
    required this.startAt,
    required this.endAt,
    required this.organizers,
    // required this.eventPage,
    // required this.registration,
    // required this.community,
    // required this.featured,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        displayName: json['displayName'],
        description: json['description'],
        subtitle: json['subtitle'],
        startAt: json['startAt'],
        endAt: json['endAt'],
        organizers: json['organizers']);
    // eventPage: json['eventPage'],
    // registration: json['registration'],
    // community: json['community'],
    // featured: json['featured']);
  }
}
