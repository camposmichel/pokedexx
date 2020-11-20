import 'package:flutter/material.dart';

// Get string capitalized
String capitalize(String string) {
  if (string == null) {
    throw ArgumentError.notNull('string');
  }

  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}

// Show snackbar
showSnackBar(GlobalKey<ScaffoldState> key, String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    key.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  });
}
