import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static void setStatusBarColor(BuildContext context, {bool isLight = true}) {
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;

    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white12, systemNavigationBarDividerColor: Colors.white12));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white24));
    }
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
