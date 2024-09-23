import 'package:flutter/material.dart';

const decorationTextFiled = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
  filled: true,
);
