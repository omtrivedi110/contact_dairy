import 'package:flutter/material.dart';

SnackBar mysnackbar({required String text, required Color color}) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 3),
    backgroundColor: color,
    showCloseIcon: true,
  );
}
