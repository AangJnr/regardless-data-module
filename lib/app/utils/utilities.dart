import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static void setStatusBarColor(BuildContext context, {bool isLight = true}) {
    SystemChrome.setSystemUIOverlayStyle(
      isLight
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black54)
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black54),
    );
  }

  static String parseDate(String? date) {
    try {
      var format = DateFormat('EEE, MMM d yyyy', 'en_US');
      return format.format(DateFormat('dd/MM/yyyy', 'en_US').parse(
        date ?? '',
      ));
    } catch (e) {
      debugPrint(e.toString());
      return "--";
    }
  }

  static getAcronym(String? name) {
    if (name?.isEmpty == true) return '';
    List<String> letters = name!.split(" ");
    if (letters.length == 1) {
      return letters[0][0];
    }

    String s = "";
    for (String letter in letters) {
      s += letter[0];
    }

    return s.length < 3 ? s.toUpperCase() : s.substring(0, 2).toUpperCase();
  }
}
