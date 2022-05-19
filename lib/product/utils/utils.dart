import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'color.dart';

class Utils {
  String DT_toString(DateTime dateTime) {
    var outputFormat = DateFormat('dd MMM yyyy');
    String outputDate = outputFormat.format(dateTime).toString();
    return outputDate;
  }

  String DTA_toString(DateTime dateTime) {
    var outputFormat = DateFormat('dd MMM yyyy H:m:s');
    String outputDate = outputFormat.format(dateTime).toString();
    return outputDate;
  }

  Color StatusCheck(String status) {
    Color color = stat_closed;
    switch (status) {
      case "Forecast":
        color = stat_forecast;
        break;
      case "Scheduled":
        color = stat_schedule;
        break;
      case "Completed":
        color = stat_completd;
        break;
      case "Not Accepted":
        color = stat_not_accp;
        break;
      default:
        break;
    }
    return color;
  }
}

//Global Spacer
Widget spacer(double size) {
  return SizedBox(height: size, width: size);
}
