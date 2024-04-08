import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'api_exceptions.dart';

void showErrorSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void handleError(BuildContext context, dynamic error) {
  if (error is ApiException) {
    showErrorSnackBar(context, 'API Error: ${error.message}');
  } else {
    showErrorSnackBar(context, 'An error occurred. Please try again later.');
  }

  // Log the error using the logging framework
  Logger.root.severe('Error: $error');
}