import 'dart:convert' show base64Encode;
import 'dart:math';

import 'package:cross_file/cross_file.dart';
import 'package:mime/mime.dart';
import 'enums.dart';

extension StringExtension on String? {
  SidebarItem toItem() {
    switch (this) {
      case '/home':
      case 'dashboard':
        return SidebarItem.home;
      case 'events/new':
        return SidebarItem.addEvent;
      case 'events':
        return SidebarItem.myEvents;
      case 'followers/:uid':
      case 'followers/all':
        return SidebarItem.followers;
      case 'notifications/:uid':
      case 'notifications/all':
        return SidebarItem.notifications;
      case 'subscriptions/:uid':
      case 'subscriptions/all':
        return SidebarItem.subscriptions;
      default:
        return SidebarItem.home;

      // case SidebarItem.myEvents:
      //   return 'My Events';
      // case SidebarItem.followers:
      //   return 'Followers';
      // case SidebarItem.subscriptions:
      //   return 'Subscriptions';
      // case SidebarItem.notifications:
      //   return 'Notifications';
      // case SidebarItem.account:
      //   return 'Account';
      // case SidebarItem.settings:
      //   return 'Settings';
    }
  }

  String toCapitalCase() {
    if (this == null || this?.isEmpty == true) {
      return "";
    }

    // Split the string into words using whitespace as the separator.
    List<String> words = this!.split(' ');

    // Capitalize the first letter of each word and join them back into a single string.
    String capitalCaseString = words.map((word) {
      if (word.isNotEmpty) {
        return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
      }
      return word;
    }).join(' ');

    return capitalCaseString;
  }

  Gender apiToGender() {
    switch (this) {
      case "Male":
        return Gender.Male;
      case "Female":
        return Gender.Female;
      case "Non-binery":
        return Gender.NonBinary;
      case "Unsure":
        return Gender.Unsure;
      default:
        return Gender.RatherNotSay;
    }
  }

  Gender stringToGender() {
    switch (this) {
      case "Male":
        return Gender.Male;
      case "Female":
        return Gender.Female;
      case "Non Binary":
        return Gender.NonBinary;
      case "Unsure":
        return Gender.Unsure;
      default:
        return Gender.RatherNotSay;
    }
  }
}

extension GenderExtension on Gender {
  String string() {
    switch (this) {
      case Gender.Male:
        return "Male";
      case Gender.Female:
        return "Female";
      case Gender.NonBinary:
        return "Non Binary";
      case Gender.Unsure:
        return "Unsure";
      default:
        return "I do not wish to disclose";
    }
  }

  String toApi() {
    switch (this) {
      case Gender.Male:
        return "Male";
      case Gender.Female:
        return "Female";
      case Gender.NonBinary:
        return "Non-binery";
      case Gender.Unsure:
        return "Unsure";
      case Gender.RatherNotSay:
        return "Rather not say";
    }
  }
}

extension DoubleExtensions on double {
  double toRadians() {
    return this * (pi / 180.0);
  }

  double toDegrees() {
    return this * (180.0 / pi);
  }
}

extension XFileExtensions on XFile {
  Future<String> fileToString() async {
    List<int> imageBytes = await readAsBytes();
    final base64String = base64Encode(imageBytes);
    // Determine MIME type
    final mimeType = lookupMimeType(path);
    // Format according to the data URI scheme
    return 'data:$mimeType;base64,$base64String';
  }
}

enum SidebarItem {
  home,
  addEvent,
  myEvents,
  followers,
  subscriptions,
  notifications,
}

extension SidebarItemExtension on SidebarItem {
  String get name {
    switch (this) {
      case SidebarItem.home:
        return 'Home';
      case SidebarItem.addEvent:
        return 'Add Event';
      case SidebarItem.myEvents:
        return 'My Events';
      case SidebarItem.followers:
        return 'Followers';
      case SidebarItem.subscriptions:
        return 'Subscriptions';
      case SidebarItem.notifications:
        return 'Notifications';
      // case SidebarItem.account:
      //   return 'Account';
      // case SidebarItem.settings:
      //   return 'Settings';
    }
  }

  String get icon {
    switch (this) {
      case SidebarItem.home:
        return 'assets/icons/home.png';
      case SidebarItem.addEvent:
        return 'assets/icons/add_event.png';
      case SidebarItem.myEvents:
        return 'assets/icons/my_events.png';
      case SidebarItem.followers:
        return 'assets/icons/followers.png';
      case SidebarItem.subscriptions:
        return 'assets/icons/subscriptions.png';
      case SidebarItem.notifications:
        return 'assets/icons/notifications.png';
      // case SidebarItem.account:
      //   return 'assets/icons/my_account.png';
      // case SidebarItem.settings:
      //   return 'assets/icons/settings.png';
    }
  }
}
