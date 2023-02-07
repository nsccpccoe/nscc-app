import 'package:get/get.dart';
import 'package:nscc_app/models/event_model.dart';
import 'package:nscc_app/services/fetch_events.dart';

class EventController extends GetxController {
  var isLoading = false.obs;

  List<EventModel> data = [];

  Future<void> fetchEvents() async {
    isLoading.value = true;
    update();
    // return await EventMethods().fetchEvents();
    try {
      Map<String, dynamic> result = await EventMethods().fetchEvents();

      for (var x in result["data"]) {
        data.add(EventModel.fromJson(x));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
