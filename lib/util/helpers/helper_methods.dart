
import 'package:et_movie_tickets/mvc/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbols.dart' as intl;
import 'app_shared_preferences.dart';
import 'keys.dart';

String enumToString<T extends Enum>(T value) =>
    value.toString().split('.').last;

String getHoursAndMinutes(int totalMinutes, bool isRequiredInShortTerm) {
  if (totalMinutes <= 0) {
    return "0h 0m";
  } else {
    int days = (totalMinutes / 24 / 60).toInt();
    int hours = (totalMinutes / 60 % 24).toInt();
    int minutes = totalMinutes % 60;

    String hoursAndMinutes = "";

    if (days > 0) {
      hoursAndMinutes +=
          "$days ${days > 1 ? "Days".tr : "Day".tr}${(hours > 0 || minutes > 0) ? "," : ""} ";
    }
    if (hours > 0) {
      if (isRequiredInShortTerm) {
        hoursAndMinutes += "${hours}h";
      } else {
        hoursAndMinutes += "$hours ${hours > 1 ? "hours".tr : "hour".tr}";
      }
    }
    if (minutes > 0) {
      if (isRequiredInShortTerm)
        hoursAndMinutes += " ${minutes}m";
      else {
        hoursAndMinutes +=
            " ${(hours > 0 || days > 0) ? "And".tr : ""} $minutes ${minutes > 1 ? "minutes".tr : "minute".tr} ";
      }
    }
    return hoursAndMinutes;
  }
}

void sessionExpired(bool isBooking) {
  if (isBooking) {
    Get.defaultDialog(
      title: "SessionExpired".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      content: Text('YourSessionHasExpired'.tr),
      actions: [
        TextButton(
          onPressed: () {
            Get.offAll(HomeScreenPage(0));
          },
          child: Text(
            'StartOver'.tr,
            //style: TextStyle(color: Keys.primaryColor),
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

class CapitalizeFirstStringFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      if (newValue.text.isNotEmpty) {
        if (newValue.text.length > 1) {
          return TextEditingValue(
              text: newValue.text[0].toUpperCase() +
                  newValue.text.substring(1).toLowerCase(),
              selection: newValue.selection);
        } else {
          return TextEditingValue(
              text: newValue.text[0].toUpperCase(),
              selection: newValue.selection);
        }
      } else {
        return TextEditingValue(selection: newValue.selection);
      }
    } catch (ex, stack) {
      //ex.logAsync(stack);
      return TextEditingValue(selection: newValue.selection);
    }
  }
}

void changeLanguage(String lang, String languageName) {
  try {
    //Get.updateLocale(Locale(lang));
    var selectedLang = lang;
    if (selectedLang == "RA" || selectedLang == "ra") {
      selectedLang = "ar";
    }
    Get.updateLocale(Locale(selectedLang));
    AppSharedPreferences.setLanguage(selectedLang);
    AppSharedPreferences.setLanguageName(languageName);
  } catch (ex, stack) {
    //ex.logAsync(stack);
  }
}

String getTextFromErrorList(
    String? messageAPI, String? message, List<String?>? errorList) {
  String errorListMessage = "";
  if (messageAPI != null || message != null) {
    errorListMessage = "${messageAPI ?? message}\n";
  }

  if (errorList != null && errorList.isNotEmpty) {
    int i = 1;
    for (var error in errorList) {
      errorListMessage = "$errorListMessage${i.toString()}. $error\n";
      i++;
    }
  }

  if (errorListMessage.isEmpty) {
    errorListMessage = "UnableToPerformTheRequestedOperation".tr;
  }
  return errorListMessage;
}

bool isPhoneNumber(String s) {
  if (s.length > 16 || s.length < 5) return false;
  return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}

