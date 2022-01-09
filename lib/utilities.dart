import "package:flutter/material.dart";

Color customColor({String? date}) {
  switch (date) {
    case "Today":
      return Colors.blue;

    case "Yesterday":
      return Colors.purple;

    case "Tomorrow":
      return Colors.pink;

    default:
      return Colors.grey.shade500;
  }
}
