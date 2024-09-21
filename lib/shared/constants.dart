import 'package:flutter/material.dart';

const decorationTextFiled = InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: const BorderRadius.all(
      Radius.circular(12),
    ),
  ),
  filled: true,
);
