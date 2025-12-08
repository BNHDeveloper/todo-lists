import 'package:flutter/material.dart';

class Todo {
  final String title;
  final bool finished;
  final VoidCallback onTap;

  Todo({
    required this.title,
    required this.finished,
    required this.onTap,
  });
}