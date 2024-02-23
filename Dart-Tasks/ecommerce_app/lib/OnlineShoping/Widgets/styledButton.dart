import 'package:flutter/material.dart';

Widget styledButton(String name, double width, Color color) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: color,
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
