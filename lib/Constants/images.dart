import 'package:flutter/material.dart';

Widget imageNetwork(
  String text,
) {
  return Image.network(
    text,
    width: 150,
    loadingBuilder:
        (BuildContext context, Widget child, dynamic loadingProgress) {
      if (loadingProgress == null) return child;
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return const Text('Error loading image');
    },
  );
}
