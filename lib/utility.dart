import 'package:flutter/material.dart';
import 'dart:math';

// Define a reusable function
String generateRandomStringId(int length) {
  final random = Random();
  const availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();

  return randomString;
}

Widget buildLoading() => const Center(child: CircularProgressIndicator());

// void showToast(String msg) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.TOP,
//       backgroundColor: Colors.blueAccent,
//       textColor: Colors.white);
// }

List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}
