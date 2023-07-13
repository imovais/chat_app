// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


Widget notification_circle(String num) {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
        color: Colors.teal, borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: Text(
        num,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    ),
  );
}
