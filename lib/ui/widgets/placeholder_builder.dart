import 'package:flutter/material.dart';

class PlaceholderBuilder extends InheritedWidget {
  final WidgetBuilder Function() builder;
  final WidgetBuilder Function() errorBuilder;

  const PlaceholderBuilder({
    super.key,
    required this.builder,
    required this.errorBuilder,
    required super.child,
  });

  static PlaceholderBuilder? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlaceholderBuilder>();
  }

  @override
  bool updateShouldNotify(PlaceholderBuilder oldWidget) {
    return builder != oldWidget.builder ||
        errorBuilder != oldWidget.errorBuilder;
  }
}
