import 'package:flutter/material.dart';
import 'package:foodapp/constant/color.dart';
import 'package:foodapp/constant/testStyle.dart';

Widget buttonui(icon) {
  return Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: white,
          boxShadow: [boxShadow],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: icon);
}
