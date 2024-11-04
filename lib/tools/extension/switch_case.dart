import 'package:flutter/material.dart';

getMemberColor(String type) {
  Color colorByNum;

  var map = {
    "1": const Color(0xFF7467DC),
    "2": const Color(0xFFff3030),
    "3": const Color(0xFFFF7B30),
    "4": const Color(0xffEF3A8C),
    "5": const Color(0xFF7467DC),
    "6": const Color(0xFFff3030),
  };
  colorByNum = map[type.toLowerCase()] ?? const Color(0x0ff2528f);
  return colorByNum;
}
