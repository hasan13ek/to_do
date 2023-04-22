import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';

const String splashPage = '/';
const String tabBox = '/tab_page';
const String allTasks = "/all_tasks_page";
const String home = "/home_page";

myHeight(context) => MediaQuery.of(context).size.height;
myWidth(context) => MediaQuery.of(context).size.width;

InputDecoration getInputDecoration({required String label}) {
  return  InputDecoration(
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    hintText: label,
    focusColor: const Color(0xffcfcfcf),
    hintStyle: fontRubikW300(appcolor: Colors.black),
    filled: true,
    fillColor: Colors.white.withOpacity(0.8),
  );
}
