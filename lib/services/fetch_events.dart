import 'package:dio/dio.dart';

class EventMethods {
  Future<Map<String, dynamic>> fetchEvents() async {
    final String apiurl =
        "https://asia-south1-nsccpccoe.cloudfunctions.net/events";
    var response = await Dio().get(apiurl);
    Map<String, dynamic> result = response.data;
    return result;
  }
}
