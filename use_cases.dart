import 'package:flutter/material.dart';

class UseCase {
  final String route;
  final WidgetBuilder buildWithContext;

  UseCase({required this.route, required this.buildWithContext});
}

final List<UseCase> useCases = [
  UseCase(
    route: '/example',
    buildWithContext: (context) => const Center(
      child: Text('Hello from your new app screen!'),
    ),
  ),
];
