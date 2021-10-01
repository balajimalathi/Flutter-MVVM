import 'package:flutter/material.dart';

import 'color.dart';

var title = TextStyle(fontSize: 18);
var headline = TextStyle(fontSize: 16);
var body = TextStyle(fontSize: 14);
var subtitle = TextStyle(fontSize: 14);
var caption = TextStyle(fontSize: 10);
var titlebar = TextStyle(fontSize: 20);

double s_title =  18;
double s_headline =  16;
double s_body = 14;
double s_subtitle =  12;
double s_caption =  10;

textInputDecoration(hint) {
  return InputDecoration(
      filled: true,
      isDense: true,
      fillColor: white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
            color: secondaryColor.withOpacity(0.8), width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderColor, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
          vertical: 14, horizontal: 8.0),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500));
}

searchInputDecoration(hint) {
  return InputDecoration(
      filled: true,
      isDense: true,
      fillColor: white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
            color: secondaryColor.withOpacity(0.8), width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderColor, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
          vertical: 14, horizontal: 8.0),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.w500));
}

textInputStyle(){
  return TextStyle(color: black, fontFamily: "RedHatDisplay", fontSize: 16.0, letterSpacing: 0.25);
}