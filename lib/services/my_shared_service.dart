import 'package:shared_preferences/shared_preferences.dart';

class MySharedService {
  Future<bool> setSharedToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDone = await prefs.setString('token', token);
    return isDone;
  }

  Future<bool> setSharedPhoneNumber(String number) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDone = await prefs.setString('phoneNumber', number);
    return isDone;
  }

  Future<bool> setSharedUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDone = await prefs.setString('userID', id);
    return isDone;
  }

  Future<String?> getSharedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<String?> getSharedPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber');
  }

  Future<String?> getSharedUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userID');
  }
}
