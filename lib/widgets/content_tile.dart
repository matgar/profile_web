import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  const ContentTile({
    Key? key,
    required this.title,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        title,
        const SizedBox(height: 16),
        Wrap(
          runSpacing: 8,
          children: children),
      ],
    );
  }
}
